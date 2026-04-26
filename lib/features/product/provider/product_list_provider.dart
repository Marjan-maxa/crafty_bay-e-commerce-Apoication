import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/product/presentation/models/product_list_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/urls.dart';

class ProductListProvider extends ChangeNotifier {
  final int _pagecount = 30;
  int _currentPage = 0;
  int? _lastPage;
  String? _errorMassage;
  // initial loading
  bool _isInitialLoading = false;

  // more data loading
  bool _ismoreDataLoadng = false;
  List<ProductListModel> _productlist = [];

  bool get isInitialLoading => _isInitialLoading;
  bool get ismoreDataLoading => _ismoreDataLoadng;
  String? get errorMassage => _errorMassage;
  List<ProductListModel> get productlist => _productlist;

  Future<bool> getProduct(String productId) async {
    if (isLoading) {
      return false;
    }
    if (_lastPage != null && _currentPage >= _lastPage!) {
      return false;
    }
    bool isSuccess = false;
    _currentPage++;
    print("CALL API PAGE: $_currentPage");
    if (_currentPage == 1) {
      _isInitialLoading = true;
    } else {
      _ismoreDataLoadng = true;
    }
    notifyListeners();

    final NetWorkResponse response = await getNetworkCaller().getRequest(
      Urls.getproductUrl(_pagecount, _currentPage),
    );
    if (response.isSuccess) {
      List<ProductListModel> products = [];
      _lastPage = response.body!['data']['last_page'];
      for (Map<String, dynamic> product in response.body!['data']['results']) {
        products.add(ProductListModel.fromJson(product));
      }
      _productlist.addAll(products);

      isSuccess = true;
      _errorMassage = null;
    } else {
      _errorMassage = response.errorMesssage;
    }
    if (_currentPage == 1) {
      _isInitialLoading = false;
    } else {
      _ismoreDataLoadng = false;
    }
    notifyListeners();
    return isSuccess;
  }

  bool get isLoading => _isInitialLoading || _ismoreDataLoadng;
}
