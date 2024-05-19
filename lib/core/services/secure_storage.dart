import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage{
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  // Tokeni alma
  Future<String> getToken() async {
    final token = await _secureStorage.read(key: 'token');

    if (token != null){
      return token;
    }else{
      return "";
    }
  }

  // Tokeni silme
  void deleteToken() async {
    await _secureStorage.delete(key: 'token');
  }

  // Token kaydetme
  Future<void> saveToken(String token) async{
    await _secureStorage.write(key: 'token', value: token);
  }


}