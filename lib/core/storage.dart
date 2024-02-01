// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  //kullanıcı bilgisini yüklemek için kullandığımız storage yapısı
  loadUser() async {
    SharedPreferences storage = await SharedPreferences.getInstance();

    var id = storage.getInt("id");
    var name = storage.getString("name");
    var phone = storage.getString("phone");
    var email = storage.getString("email");

    if (id == null) {
      return null;
    } else {
      return {"id": id, "name": name, "phone": phone, "email": email};
    }
  }

  //kullanıcı bilgisi kaydı için kullandığımız storage yapısı
  saveUser({
    required int id,
    required String name,
    required String email,
    required String phone,
  }) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setInt("id", id);
    storage.setString("name", name);
    storage.setString("email", email);
    storage.setString("phone", phone);
  }

  //token storage yapısı
  saveToken(String token) async {
    final storage = new FlutterSecureStorage();
    await storage.write(key: "token", value: token);
  }

  loadToken() async {
    final storage = new FlutterSecureStorage();
    var token = await storage.read(key: "token");
    return token;
  }
}
