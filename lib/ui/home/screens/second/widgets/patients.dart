import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/alert_screen_format.dart';
import 'package:cuivi_medic/ui/home/screens/second/screens/patient_information.dart';
import 'package:cuivi_medic/ui/providers/patient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Patients extends StatefulWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  State<Patients> createState() => _PatientsState();
}

class _PatientsState extends State<Patients> {
  var isInit = false;
  TextEditingController search = TextEditingController();

  var _isLoading = false;
  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PatientProvider>(context).getPatient(context).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      isInit = true;
      super.didChangeDependencies();
    }
  }

  bool onpressed = false;
  @override
  Widget build(BuildContext context) {
    final patientProvider = Provider.of<PatientProvider>(context);

    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: TextField(
                        style: TextStyle(),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                          labelText: ' Buscar',
                        ),
                        controller: search,
                        textCapitalization: TextCapitalization.sentences,
                        onEditingComplete: () {
                          setState(() {
                            search;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    itemCount: patientProvider.add.length,
                    itemBuilder: ((context, index) {
                      final patient = patientProvider.add[index];
                      logger.d(patient.photo);
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            child: patient.photo!
                                                    .contains("avatars")
                                                ? Icon(Icons.person)
                                                : Image.network(patient.photo!),
                                            radius: 50,
                                          ),
                                          SizedBox(width: 10),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(patient.name ?? ''),
                                              Text(patient.email ?? ''),
                                            ],
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return PatientsInformation(
                                                    patientId:
                                                        patient.patientId!,
                                                    id: patient.id!,
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.more_vert,
                                            color: Color.fromARGB(
                                                255, 119, 119, 119),
                                          ))
                                    ],
                                  ),
                                )),
                          ]);
                    })),
              ),
            ],
          );
  }
}
