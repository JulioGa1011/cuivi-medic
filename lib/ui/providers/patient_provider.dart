import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/expedient_model.dart';
import 'package:cuivi_medic/ui/models/patient_model.dart';
import 'package:cuivi_medic/ui/services/patient_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  PatientProvider();
  final List<PatientModel> _add = [];
  List<PatientModel> get add => _add;
  final List<PatientModel> _patient = [];
  List<PatientModel> get patient => _patient;
  final List<PatientExpedientModel> _medicalHistory = [];
  List<PatientExpedientModel> get medicalHistory => _medicalHistory;

  Future<void> getPatient(context) async {
    _add.clear();
    final res = await PatientServices().getPatients(context);
    res.data["data"].forEach((element) {
      _add.add(PatientModel.fromJson(element));
    });
    notifyListeners();
  }

  Future<void> patientInformation(context, patientId) async {
    _patient.clear();
    final res = await PatientServices().patientInformation(context, patientId);
    _patient.add(PatientModel.fromJson(res.data));
    notifyListeners();
  }

  Future<void> getMedicalInformatioPatiens(context, patientId) async {
    _medicalHistory.clear();
    final res =
        await PatientServices().getMedicalInformatioPatiens(context, patientId);
    _medicalHistory.add(PatientExpedientModel.fromJson(res.data));
    logger.d(_medicalHistory.length);
    notifyListeners();
  }
}
