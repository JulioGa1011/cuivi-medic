import 'package:cuivi_medic/main.dart';
import 'package:cuivi_medic/ui/models/store_model.dart';
import 'package:cuivi_medic/ui/services/store_services.dart';
import 'package:flutter/cupertino.dart';

class StoreProvider extends ChangeNotifier {
  final List<StoreModel> _product = [];
  List<StoreModel> get product => _product;

  Future<void> getProduct(context) async {
    _product.clear();
    final res = await StoreServices().getProducts(context);
    logger.d(res);

    res.data['data'].forEach((element) {
      _product.add(StoreModel.fromJson(element));
    });

    notifyListeners();
  }
}
