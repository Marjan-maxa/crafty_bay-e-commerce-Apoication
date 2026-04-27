import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/product/presentation/models/product_details_model.dart';
import 'package:flutter/material.dart';

import '../../../app/urls.dart';

class ProductDetailsProvider extends ChangeNotifier {
  bool _getProductDetailsProgress = false;
  bool get getProductDetailsProgress => _getProductDetailsProgress;

  String? _errormessage;
  String? get errormessage => _errormessage;

  ProductDetailsModel? _productDetails;
  ProductDetailsModel? get productDetails => _productDetails;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _getProductDetailsProgress = true;
    notifyListeners();

    final NetWorkResponse response = await getNetworkCaller().getRequest(
      Urls.getproductDetailsUrl(productId),
    );

    if (response.isSuccess) {
      final data = response.body!['data'];
      if (data is List && data.isNotEmpty) {
        _productDetails = ProductDetailsModel.fromJson(data[0]);
      } else if (data is Map<String, dynamic>) {
        _productDetails = ProductDetailsModel.fromJson(data);
      }
      _errormessage = null;
      isSuccess = true;
    } else {
      _errormessage = response.errorMesssage;
    }

    _getProductDetailsProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
