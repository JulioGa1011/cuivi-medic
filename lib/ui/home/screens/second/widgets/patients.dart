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
        : SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: patientProvider.add.length,
                itemBuilder: ((context, index) {
                  final patient = patientProvider.add[index];
                  return Column(children: [
                    Container(
                        height: MediaQuery.of(context).size.height * .08,
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.person),
                                  Text(patient.name ?? ''),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                              title: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .08,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(
                                                      Icons.note_add),
                                                  onPressed: () {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            contex544t) {
                                                          return const AlertScreenFormat();
                                                        });
                                                  },
                                                ),
                                                const Icon(
                                                    Icons.medication_sharp),
                                                IconButton(
                                                    icon: const Icon(
                                                        Icons.remove_red_eye),
                                                    onPressed: () {
                                                      showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              contex544t) {
                                                            return PatientsInformation(
                                                              patientId: patient
                                                                  .patientId!,
                                                              id: patient.id!,
                                                            );
                                                          });
                                                    }),
                                                const Icon(Icons.file_copy),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.cancel)),
                                              ],
                                            ),
                                          ));
                                        });
                                  },
                                  icon: onpressed
                                      ? const Icon(
                                          Icons.arrow_downward,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.black,
                                        ))
                            ],
                          ),
                        )),
                    onpressed
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * .08,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.note_add),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext contex544t) {
                                          return const AlertScreenFormat();
                                        });
                                  },
                                ),
                                const Icon(Icons.medication_sharp),
                                IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext contex544t) {
                                            return PatientsInformation(
                                              id: patient.id!,
                                              patientId: patient.patientId!,
                                            );
                                          });
                                    }),
                                const Icon(Icons.file_copy),
                              ],
                            ),
                          )
                        : const SizedBox(
                            height: 10,
                          ),
                  ]);
                })),
          );
  }
}
