import '../../../../core/storage/cache_manager.dart';

class LoginController {
  String? _email;
  String? _password;

  Future<void> _fillData() async {
    try {
      _email = CacheManager.getDate(key: 'userName');
      _password = CacheManager.getDate(key: 'password');
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<bool> login (String userName, String password) async {
    print(_email);
    print(_password);
    print(userName);
    print(password);
    await _fillData();
    if (userName == _email && password == _password) {
      return true;
    }
    else {
      return false;
    }
  }
}