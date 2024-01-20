import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {

  final storage = new FlutterSecureStorage();
 Future<void> save (String key , String value)async { //
    await storage.write(key: key, value: value);

  }
  Future<String?> read (String key )async { // read the token and give me value
   return  await storage.read(key: key);

  }
}