import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/cart/data/models/cart_model.dart';
import 'package:flutter/material.dart';

import '../../../app/urls.dart';

class CartListProvider extends ChangeNotifier {
  bool _getCartListInProgress = false;

  bool get getCartListInProgress => _getCartListInProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  List<CartModel> _cartList = [];

  List<CartModel> get cartList => _cartList;

  Future<bool> getCartList() async {
    bool isSuccess = false;
    _getCartListInProgress = true;
    notifyListeners();

    final NetWorkResponse response = await getNetworkCaller().getRequest(
      Urls.cartListUrl,
    );

    if (response.isSuccess) {
      List<CartModel> carts = [];
      for (Map<String, dynamic> cart in response.body!['data']['results']) {
        carts.add(CartModel.fromJson(cart));
      }
      _cartList = carts;
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMesssage;
    }

    _getCartListInProgress = false;
    notifyListeners();
    return isSuccess;
  }

  int get totalQuantity => _cartList.length;
  double get totalPrice {
    double total = 0;
    for (CartModel cartItem in _cartList) {
      total += (cartItem.productModel.currentPrice) * cartItem.quantity;
    }
    return total;
  }

  void updateCartItemQuantity(String cartId, int quantity) {
    _cartList.firstWhere((cartItem) => cartItem.id == cartId).quantity =
        quantity;
    notifyListeners();
  }
}
