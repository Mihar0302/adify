import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences pref;

  SharedPreferencesHelper({required this.pref});

  String? setpublic(String publickkey) {
    pref.setString("cipherKey", publickkey);
    return null;
  }

  Future<void> setjWT(String jwt) async {
    await pref.setString("jwt", jwt);
  }

  Future<void> setUserName(String jwt) async {
    await pref.setString("adifyUserName", jwt);
  }

  String? get getUserName {
    return pref.getString("adifyUserName");
  }

  String? get getJWT {
    return pref.getString("jwt");
  }

  Future<void> setLang(String lang) async {
    await pref.setString("lang", lang);
  }

  String get getLang {
    return pref.getString("lang") ?? "";
  }
}
