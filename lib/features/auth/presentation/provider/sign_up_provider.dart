import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:flutter/material.dart';

import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../data/models/signup_params.dart';

class SignUpProvider extends ChangeNotifier{
  bool _isSignUpProgress=false;
  bool get isSignUpProgress=>_isSignUpProgress;
  String ?_errorMessage;
  String ? get errorMessage=>_errorMessage;

  Future<bool>signUp(SignupParams params)async{
    bool isSuccess=false;

    _isSignUpProgress=true;
    notifyListeners();

    final NetWorkResponse response=await getNetworkCaller().postRequest(
      Urls.signUpUrl,
      body: params.toJson(),
    );
    if(response.isSuccess){
      _errorMessage=null;
      isSuccess=true;
    }else{
      _errorMessage=response.errorMesssage;
    }

    _isSignUpProgress=false;
    notifyListeners();
    return isSuccess;

  }
}