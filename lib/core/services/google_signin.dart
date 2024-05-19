import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninHelper{

  static final GoogleSigninHelper _instance = GoogleSigninHelper._private();
  GoogleSigninHelper._private();

  static GoogleSigninHelper get instance => _instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAuthentication?> googleSignIn() async{
    final user = await _googleSignIn.signIn();
    
    if(user != null){
      final userData = await user.authentication;
      return userData;
    }
    
    return null;
  }

}