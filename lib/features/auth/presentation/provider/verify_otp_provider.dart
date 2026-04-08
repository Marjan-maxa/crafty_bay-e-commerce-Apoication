import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:flutter/material.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../data/models/OtpParams.dart';


class VerifyOtpProvider extends ChangeNotifier{
  bool _isotpProgress=false;
  bool get isotpProgress=>_isotpProgress;
  String ?_errorMessage;
  String ? get errorMessage=>_errorMessage;

  Future<bool>OTp(Otpparams params)async{
    bool isSuccess=false;

    _isotpProgress=true;
    notifyListeners();

    final NetWorkResponse response=await getNetworkCaller().postRequest(
      Urls.otpUrl,
      body: params.toJson(),
    );
    if(response.isSuccess){
      _errorMessage=null;
      isSuccess=true;
    }else{
      _errorMessage=response.errorMesssage;
    }

    _isotpProgress=false;
    notifyListeners();
    return isSuccess;

  }
}