import 'dart:convert';
import 'dart:io';

import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/providers/doctor_providers.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Photo extends StatefulWidget {
  const Photo({Key? key}) : super(key: key);

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  String? photo;
  var isInit = false;
  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<DoctorProvider>(context).aboutMe(context).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;

      super.didChangeDependencies();
    }
  }

  final ImagePicker _picker = ImagePicker();
  late String base64Image;

  // Pick an image
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      final bytes = File(image.path).readAsBytesSync();
      base64Image = 'data:image/png;base64,${base64Encode(bytes)}';
      logger.d(base64Image);
    } else {
      throw Exception('Image is null');
    }
  }

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1000,
      maxHeight: 1000,
    );
    if (photo != null) {
      final bytes = File(photo.path).readAsBytesSync();
      base64Image = 'data:image/png;base64,${base64Encode(bytes)}';
      logger.d(base64Image);
    } else {
      throw Exception('Image is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<DoctorProvider>(context);
    var size = MediaQuery.of(context).size;
    profile.add.forEach((element) {
      logger.d(element.profilePhotoUrl);
      setState(() {
        photo = element.profilePhotoUrl;
      });
    });
    return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) {
              return SizedBox(
                height: 150,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        _takePhoto();
                      },
                      splashColor: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.camera_alt_outlined, size: 30),
                            SizedBox(width: 10),
                            Text(
                              'Cámara',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _pickImage().then((value) {
                          // _submitImage(context);
                        }).catchError((_) {});
                      },
                      splashColor: Colors.black26,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          children: const [
                            Icon(Icons.photo_library_outlined, size: 30),
                            SizedBox(width: 10),
                            Text(
                              'Galería',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: photo != null
            ? CircleAvatar(
                radius: 100,
                child: ClipOval(
                    child: Image.network(
                  photo!,
                  fit: BoxFit.cover,
                )),
              )
            : Column(
                children: [
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: size.height * 0.25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              )
        // profileProvider.user.profilePhotoPath ==
        //         dotenv.env['baseUrlStorage']
        //     ?
        // const Icon(Icons.person)
        //  Container(
        //     width: widget.height,
        //     height: widget.height,
        //     decoration: BoxDecoration(
        //       shape: BoxShape.circle,
        //       image: profileProvider.user.profilePhotoPath.isEmpty
        //           ? null
        //           : DecorationImage(
        //               fit: BoxFit.cover,
        //               image: NetworkImage(
        //                 profileProvider.user.profilePhotoPath,
        //               ),
        //             ),
        //     ),
        //     child: profileProvider.user.profilePhotoPath.isEmpty
        //         ? Container(
        //             decoration: const BoxDecoration(
        //               color: Colors.blue,
        //               shape: BoxShape.circle,
        //             ),
        //             child: Icon(
        //               Icons.person,
        //               size: widget.height * 0.8,
        //               color: Colors.white,
        //             ),
        //           )
        //         : null,
        //   ),

        // CircleAvatar(
        //     radius: widget.height / 2,
        //     child: ClipRRect(
        //       borderRadius: BorderRadius.circular(0),
        //       child: profileProvider.user.profilePhotoPath!.isEmpty
        //           ? Container(
        //               height: widget.height,
        //               width: widget.height,
        //               color: Colors.blue,
        //               child: const Icon(
        //                 Icons.person,
        //                 size: 100,
        //               ),
        //             )
        //           : Image.network(
        //               profileProvider.user.profilePhotoPath!,
        //               fit: BoxFit.cover,
        //             ),
        //     ),
        //   ),
        );
  }
}
