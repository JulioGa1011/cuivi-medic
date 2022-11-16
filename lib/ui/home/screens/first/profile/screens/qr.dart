import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/doctor_providers.dart';

class Qr extends StatefulWidget {
  const Qr({super.key});

  @override
  State<Qr> createState() => _QrState();
}

class _QrState extends State<Qr> {
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final personal = Provider.of<DoctorProvider>(context);

    return _isLoading
        ? CircularProgressIndicator()
        : Container(
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Text('QR'),
                  Container(
                    height: size.height * 0.3,
                    width: size.height * 0.3,
                    child: SvgPicture.memory(
                      base64Decode(personal.add.first.qrCode!.split(',').last),
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )),
          );
  }
}
