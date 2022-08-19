import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/patient_model.dart';
import 'package:cuivi_medic/ui/services/patient_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PatientProvider extends ChangeNotifier {
  PatientProvider();
  final List<PatientModel> _add = [];
  List<PatientModel> get add => _add;

  Future<void> getPatient(context) async {
    _add.clear();
    final res = await PatientServices().getPatients(context);
    logger.d(res.data);
    res.data["data"].forEach((element) {
      _add.add(PatientModel.fromJson(element));
    });
    notifyListeners();
  }
}
