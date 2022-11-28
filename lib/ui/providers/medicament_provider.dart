import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/services/medicines_services.dart';
import 'package:flutter/material.dart';

import '../models/medicine.dart';

class MedicamentProvider extends ChangeNotifier {
  final List<MedicamentsPrescription> _values = [];
  List<MedicamentsPrescription> get values => _values;
  Future<void> substanceProvider(context) async {
    _values.clear();
    final res = await MedicinesServices().substanceService(context);
    res.data['data'].forEach((element) {
      _values.add(MedicamentsPrescription.fromJson(element));
    });
    logger.d('medicament provider');
    _values.sort((a, b) => a.name!.compareTo(b.name!));
    notifyListeners();
  }
}
