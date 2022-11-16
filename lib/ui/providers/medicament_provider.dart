import 'package:cuivi_medic/ui/models/types_model.dart';
import 'package:cuivi_medic/ui/services/medicines_services.dart';
import 'package:flutter/material.dart';

class MedicamentProvider extends ChangeNotifier {
  final List<TypesModel> _values = [];
  List<TypesModel> get values => _values;
  Future<void> substanceProvider(context) async {
    _values.clear();
    final res = await MedicinesServices().substanceService(context);
    res.data['data'].forEach((element) {
      _values.add(TypesModel.fromJson(element));
    });
    _values.sort((a, b) => a.name.compareTo(b.name));
    notifyListeners();
  }
}
