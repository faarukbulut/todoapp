import 'package:get/get.dart';
import 'package:todoapp/core/constants/app_constants.dart';
import 'package:todoapp/models/login/login_request.dart';
import 'package:http/http.dart' as http;

class LoginViewModel extends GetxController{

  Future<bool> userLogin(LoginRequest model) async{
    final response = await http.post(
      Uri.parse(AppConstants.authUrl + AppConstants.key),
      body: loginRequestToJson(model)
    );

    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }

  }

}