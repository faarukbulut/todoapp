import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todoapp/core/services/secure_storage.dart';

class AuthService{

  static final AuthService _instance = AuthService._private();
  AuthService._private();

  static AuthService get instance => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? cUser = FirebaseAuth.instance.currentUser;

  final SecureStorage _secureStorage = SecureStorage();

  Future signIn(GoogleSignInAuthentication userData) async{
    try{
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: userData.accessToken,
        idToken: userData.idToken
      );

      UserCredential result = await _auth.signInWithCredential(credential);
      User? user = result.user;
      var token = await user!.getIdToken();
      _secureStorage.saveToken(token ?? "");
      return user;
    }on FirebaseAuthException catch(e){
      if(e.code == "user-disabled"){
        return "user-disabled";
      }else{
        return null;
      }
    }catch (e){
      debugPrint(e.toString());
    }
  }

}