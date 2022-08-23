import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/types_model.dart';
import 'package:cuivi_medic/ui/services/types_service.dart';
import 'package:flutter/cupertino.dart';

class TypesProvider extends ChangeNotifier {
  final List<TypesModel> _types = [];
  List<TypesModel> get types => _types;
  final List<TypesModel> _social = [];
  List<TypesModel> get social => _social;
  final List<TypesModel> _expensive = [];
  List<TypesModel> get expensive => _expensive;

  Future<void> typesProvider(context) async {
    _types.clear();
    final res = await TypesServices().bloodTypes(context);
    res.data['data'].forEach((element) {
      _types.add(TypesModel.fromJson(element));
    });
    notifyListeners();
  }

  Future<void> typesSocial(context) async {
    _social.clear();
    final res = await TypesServices().soialSegurityTypes(context);
    res.data['data'].forEach((element) {
      _social.add(TypesModel.fromJson(element));
    });
    notifyListeners();
  }

  Future<void> typesExpensive(context) async {
    _expensive.clear();
    final res = await TypesServices().expensiveTypes(context);
    res.data['data'].forEach((element) {
      _expensive.add(TypesModel.fromJson(element));
    });
    notifyListeners();
  }
}
