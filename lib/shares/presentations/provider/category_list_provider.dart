import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/shares/data/model/category_list_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/urls.dart';

class CategoryListProvider extends ChangeNotifier {
  final int pageCount = 20;
  int _currentPage = 0;
  int? _lastPage;
  //initialLoading
  bool _initialLoading = false;
  String? _erreorMessage;

  //more data loading
  bool _moreDataLoading = false;
  List<CategoryListModel> _categories = [];

  bool get initialLoading => _initialLoading;
  bool get moreDataLoading => _moreDataLoading;
  String? get erreorMessage => _erreorMessage;
  List<CategoryListModel> get categories => _categories;
  Future<bool> getCategoty() async {
    bool isSuccess = false;
    if (_lastPage != null && _currentPage >= _lastPage! && isLoading) {
      return false;
    }
    _currentPage++;
    if (isInitialLoading) {
      _initialLoading = true;
    } else {
      _moreDataLoading = true;
    }
    notifyListeners();
    final NetWorkResponse response = await getNetworkCaller().getRequest(
      Urls.getcategoryUrl(pageCount, _currentPage),
    );
    if (response.isSuccess) {
      List<CategoryListModel> categories = [];
      for (Map<String, dynamic> category in response.body!['data']['results']) {
        categories.add(CategoryListModel.fromJson(category));
      }
      _categories.addAll(categories);
      isSuccess = true;
      _erreorMessage = null;
    } else {
      _erreorMessage = response.errorMesssage;
    }
    if (isInitialLoading) {
      _initialLoading = false;
    } else {
      _moreDataLoading = false;
    }
    notifyListeners();
    return isSuccess;
  }

  bool get isInitialLoading => _currentPage == 1;
  bool get isLoading => initialLoading || moreDataLoading;
}
