import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:flutter/material.dart';

import '../../../app/urls.dart';
import '../data/models/add_to_cart_params.dart';

class AddToCartProvider extends ChangeNotifier {
  bool _addToCartProgress = false;
  bool get addToCartProgress => _addToCartProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> addToCart(AddToCartParams params, ) async {
    bool isSuccess = false;
    _addToCartProgress = true;
    notifyListeners();

    final NetWorkResponse response = await getNetworkCaller().postRequest(
      Urls.addToCartUrl,
      body: params.toJson(),
    );

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMesssage;
    }

    _addToCartProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
