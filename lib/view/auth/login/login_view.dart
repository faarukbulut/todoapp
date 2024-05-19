import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/core/components/buton/custom_buton.dart';
import 'package:todoapp/core/components/textfield/custom_styles.dart';
import 'package:todoapp/core/services/firebase_auth.dart';
import 'package:todoapp/core/services/google_signin.dart';
import 'package:todoapp/models/login/login_request.dart';
import 'package:todoapp/view/products/product_list_view.dart';
import 'package:todoapp/viewmodel/login_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = Get.put(LoginViewModel());
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              buildMailField(),
          
              const SizedBox(height:16),
          
              buildSifreField(),
          
              const SizedBox(height:8),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  normalElevatedButon(
                    () async{
                      if(formKey.currentState!.validate()){
                        var model = LoginRequest(
                          email: mailController.text,
                          password: passwordController.text,
                          returnSecureToken: true,
                        );

                        var response = await _loginViewModel.userLogin(model);

                        if(response == true){
                          Get.offAll(() => const ProductListView());
                        }
                        else{
                          buildLoginErrorDialog();
                        }
                      }
                    },
                    Colors.indigo,
                    'Giriş Yap'
                  ),
                  const SizedBox(width: 10),
                  normalElevatedButon(
                    () async{
                      var userData = await GoogleSigninHelper.instance.googleSignIn();
                      if(userData != null){
                        await AuthService.instance.signIn(userData);
                      }
                    },
                    Colors.green,
                    'Google'
                  ),
                ],
              ),

              
          
            ],
          ),
        ),
      ),
    );
  }

  buildSifreField() {
    return TextFormField(
      controller: passwordController,
      decoration: customInputDecoration('Şifre'),
      validator: (val) => val!.isNotEmpty ? null : "Boş Bırakılamaz",
    );
  }

  buildMailField() {
    return TextFormField(
      controller: mailController,
      decoration: customInputDecoration('E-Posta'),
      validator: (val) => val!.isNotEmpty ? null : "Boş Bırakılamaz",
    );
  }

  buildLoginErrorDialog() async{
    await showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context){
        return AlertDialog(
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
            
                const Text('Giriş işlemi başarısız'),
            
                const SizedBox(height: 8),
            
                normalElevatedButon(
                  (){ Get.back(); }, 
                  Colors.indigo,
                  'Tamam'
                ),
            
              ],
            ),
          ),
        );
      }
    );
  }

}