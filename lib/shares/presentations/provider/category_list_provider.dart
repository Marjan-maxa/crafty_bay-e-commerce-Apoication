import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/shares/data/model/category_list_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/urls.dart';

class CategoryListProvider extends ChangeNotifier {
  final int _pagecount = 30;
  int _currentPage = 0;
  int? _lastPage;
  String? _errorMassage;
  // initial loading
  bool _isInitialLoading = false;

  // more data loading
  bool _ismoreDataLoadng = false;
  List<CategoryListModel> _categories = [];

  bool get isInitialLoading => _isInitialLoading;
  bool get ismoreDataLoading => _ismoreDataLoadng;
  String? get errorMassage => _errorMassage;
  List<CategoryListModel> get categories => _categories;

  Future<bool> getCategory() async {
    if(isLoading){
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
      Urls.getcategoryUrl(_pagecount, _currentPage),
    );
    if (response.isSuccess) {
      List<CategoryListModel> categories = [];
       _lastPage = response.body!['data']['last_page'];
      for (Map<String, dynamic> categry in response.body!['data']['results']) {
        categories.add(CategoryListModel.fromJson(categry));
      }
      _categories.addAll(categories);

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

//1:06
