import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentProvider();
  // final List<AppointmentModel> _add = [];
  // List<AppointmentModel> get add => _add;
  // Future<void> getAppointment(context) async {
  //   _add.clear();
  //   final res = await AppointmentServices().getAppointments(context);
  //   logger.d(res.data);
  //   res.data["data"].forEach((element) {
  //     _add.add(AppointmentModel.fromJson(element));
  //   });
  //   notifyListeners();
  // }
}
