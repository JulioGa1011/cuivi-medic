import 'package:flutter/material.dart';

import '../models/parameters_model.dart';
import '../services/parameterListservices.dart';

class ParametersListProvider extends ChangeNotifier {
  final List<ParametersModel> _parameters = [];
  var _isLoading = false;
  get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future getParameters(BuildContext context) async {
    _parameters.clear();
    final res = await ParametersListService().getParameter(context);
    res.data['data'].forEach((element) {
      _parameters.add(ParametersModel.fromMap(element));
    });
    notifyListeners();
  }

  List<ParametersModel> get parameters => [..._parameters];
}
