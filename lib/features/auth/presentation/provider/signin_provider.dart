
import 'package:flutter/material.dart';
import '../../../../app/controller/auth_controller.dart';
import '../../../../app/set_up_network_client.dart';
import '../../../../app/urls.dart';
import '../../../../core/network_caller/network_caller.dart';
import '../../../../shares/data/model/user_model.dart';
import '../../data/models/signin_params.dart';


class SignInProvider extends ChangeNotifier{
  bool _signInProgress=false;
  bool get signInProgress=>_signInProgress;
  String ?_errorMessage;
  String ? get errorMessage=>_errorMessage;

  Future<bool>SignIn(SigninParams params)async{
    bool isSuccess=false;

    _signInProgress=true;
    notifyListeners();

    final NetWorkResponse response=await getNetworkCaller().postRequest(
      Urls.signInUrl,
      body: params.toJson(),
      FromLoggedIn: true
    );
    if(response.isSuccess){
      UserModel userModel=UserModel.fromJson(response.body!['data']['user']);
      String accessToken=response.body!['data']['token'];
      await AuthController.SaveUserData(accessToken, userModel);
      _errorMessage=null;
      isSuccess=true;
    }else{
      _errorMessage=response.errorMesssage;
    }

    _signInProgress=false;
    notifyListeners();
    return isSuccess;

  }
}