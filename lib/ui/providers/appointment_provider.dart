import 'package:cuivi_medic/ui/models/appointment_model.dart';
import 'package:cuivi_medic/ui/services/appointment_services.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentProvider();
  final List<AppointmentModel> _add = [];
  List<AppointmentModel> get add => _add;
  Future<void> getAppointment(context) async {
    _add.clear();
    final res = await AppointmentServices().getAppointments(context);
    res.data["data"].forEach((element) {
      _add.add(AppointmentModel.fromJson(element));
    });
    notifyListeners();
  }
}
