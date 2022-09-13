import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/params_model.dart';
import 'package:cuivi_medic/ui/models/types_params_model.dart';
import 'package:cuivi_medic/ui/services/params_services.dart';
import 'package:flutter/cupertino.dart';

class ParamsProvider extends ChangeNotifier {
  final List<TypesParametersModel> _type = [];
  List<TypesParametersModel> get type => _type;
  final List<ParametersModel> _values = [];
  List<ParametersModel> get values => _values;

  Future<void> typesProvider(context) async {
    _type.clear();
    final res = await ParamsServices().paramTypes(context);
    logger.d(res);

    res.data['data'].forEach((element) {
      _type.add(TypesParametersModel.fromJson(element));
    });

    notifyListeners();
  }

  Future<void> paramsProvider(context, paramId) async {
    _values.clear();
    final res = await ParamsServices().paramsPatient(context, paramId);
    res.data['data'].forEach((element) {
      _values.add(ParametersModel.fromJson(element));
    });
    _values
        .sort((a, b) => b.formattedUpdatedAt!.compareTo(a.formattedUpdatedAt!));

    notifyListeners();
  }
}
