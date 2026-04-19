import 'package:crafty_bay/app/set_up_network_client.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/home/data/model/home_slider_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/urls.dart';

class HomeSliderProvider extends ChangeNotifier {
  bool _getHomeSliderProgress = false;
  bool get getHomeSliderProgress => _getHomeSliderProgress;
  String? _errormessage;
  String? get errormessage => _errormessage;
  List<HomeSliderModel> _HomeSlider = [];
  List<HomeSliderModel> get HomeSlider => _HomeSlider;

  Future<bool> getHomeSlider() async {
    bool isSuccess = false;
    _getHomeSliderProgress = true;
    notifyListeners();

    final NetWorkResponse response = await getNetworkCaller().getRequest(
      Urls.homeSliderUrl,
    );
    if (response.isSuccess) {
      List<HomeSliderModel> sliders = [];
      for (Map<String, dynamic> slider in response.body!['data']['results']) {
        sliders.add(HomeSliderModel.fromJson(slider));
      }
      _HomeSlider = sliders;
      _errormessage = null;
      isSuccess = true;
    } else {
      _errormessage = response.errorMesssage;
    }

    _getHomeSliderProgress = false;
    notifyListeners();
    return isSuccess;
  }
}
