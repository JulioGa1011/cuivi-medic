// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:cuivi_medic/ui/home/screens/second/screens/patient_modify.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/medical_widget.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/show_alergy.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/show_major_medical_expense.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/show_medical_diagnostic.dart';
import 'package:cuivi_medic/ui/home/screens/second/widgets/show_medicament_patient.dart';
import 'package:cuivi_medic/ui/providers/patient_provider.dart';
import 'package:cuivi_medic/ui/providers/types_provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class PatientsInformation extends StatefulWidget {
  int id;
  int patientId;
  PatientsInformation({Key? key, required this.patientId, required this.id})
      : super(key: key);

  @override
  State<PatientsInformation> createState() => _PatientsInformationState();
}

class _PatientsInformationState extends State<PatientsInformation> {
  var isInit = false;
  var _isLoading = false;
  String typeblood = '';
  String typeSocial = '';
  String typeExpensive = '';

  @override
  void didChangeDependencies() async {
    if (!isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<PatientProvider>(context, listen: true)
          .patientInformation(context, widget.id)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<PatientProvider>(context, listen: true)
          .getMedicalInformatioPatiens(context, widget.patientId)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<TypesProvider>(context, listen: true)
          .typesProvider(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<TypesProvider>(context, listen: true)
          .typesExpensive(context)
          .then((value) {
        setState(() {
          _isLoading = false;
        });
      });
      Provider.of<TypesProvider>(context, listen: true)
          .typesSocial(context)
          .then((value) {
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
    final patientProvider = Provider.of<PatientProvider>(context);
    final type = Provider.of<TypesProvider>(context);
    final patient = patientProvider.patient;
    final expedient = patientProvider.medicalHistory;
    // ignore: prefer_is_empty
    if (expedient.length > 0) {
      if (expedient.first.bloodTypeId != null) {
        type.types.forEach((element) {
          if (element.id == expedient.first.bloodTypeId) {
            setState(() {
              typeblood = element.name;
            });
          }
        });
      }
      if (expedient.first.hasSocialSecurity == true) {
        type.social.forEach((element) {
          if (element.id == expedient.first.socialSecurityId) {
            setState(() {
              typeSocial = element.name;
            });
          }
        });
      }
      if (expedient.first.hasMajorMedicalExpenseNumber == true) {
        type.expensive.forEach((element) {
          if (element.id == expedient.first.majorMedicalExpenseId) {
            setState(() {
              typeExpensive = element.name;
            });
          }
        });
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil del paciente'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: expedient.length > 0
                        ? Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                color: Colors.red,
                                child: patient.first.photo != null
                                    ? Image(
                                        image:
                                            NetworkImage(patient.first.photo!),
                                      )
                                    : Container(
                                        color: Colors.blue[100],
                                        child:
                                            const Icon(Icons.person, size: 100),
                                      ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                ' ${patient.first.name}',
                                style: const TextStyle(fontSize: 25),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              PatientModify(
                                expedient: expedient,
                                paramId: widget.patientId,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.fireFlameSimple,
                                      text: 'Tipo de sangre '),
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        typeblood,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 199, 199, 199)),
                                      )),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.contactBook,
                                      text: 'Contacto de emergencia'),
                                  ShowMedicalExpensive(
                                      name:
                                          expedient.first.emergencyContactName!,
                                      num: expedient
                                          .first.emergencyContactNumber!,
                                      seg: false),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.userDoctor,
                                      text: 'Medico de cabecera'),
                                  ShowMedicalExpensive(
                                      name: expedient.first.familyDoctorName!,
                                      num: expedient.first.familyDoctorNumber!,
                                      seg: false),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.squarePlus,
                                      text: 'Diagnostico Médico'),
                                  expedient.first.medicalDiagnostics.isNotEmpty
                                      ? ShowMedicalDiagnostic(
                                          expedient: expedient)
                                      : const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              'No hay Diagnosticos registrados por el momento'),
                                        ),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.pills,
                                      text: 'Medicamentos'),
                                  expedient.first.medicaments.isNotEmpty
                                      ? ShowMedicaments(expedient: expedient)
                                      : const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              'No hay medicamentos registrados por el momento'),
                                        ),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.faceFlushed,
                                      text: 'Alergias'),
                                  expedient.first.allergies.isNotEmpty
                                      ? ShowAllergies(expedient: expedient)
                                      : const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                              'No hay alergias registradas por el momento'),
                                        ),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.hospital,
                                      text: 'Gastos medicos mayores'),
                                  ShowMedicalExpensive(
                                    name: typeExpensive,
                                    num: expedient
                                        .first.majorMedicalExpenseNumber!,
                                    seg: true,
                                  ),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.solidHospital,
                                      text: 'Seguro social'),
                                  ShowMedicalExpensive(
                                    name: typeSocial,
                                    num: expedient.first.socialSecurityNumber!,
                                    seg: true,
                                  ),
                                  const SizedBox(height: 10),
                                  MedicalWidget(
                                      icon: FontAwesomeIcons.clipboard,
                                      text: 'Notas'),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.blue,
                                        border: Border.all(
                                          color: Color(0xFF04589A),
                                          width: 4,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            color: Colors.blue,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: const Text(
                                              'TITULO DE LA NOTA',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: Colors.white,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            child: const Center(
                                                child: Text(
                                                    'Contenido de la nota ')),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        : const Text('Este usuario no ha llenado los datos')),
              ),
            ),
    );
  }
}
