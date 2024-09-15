import 'package:jobizz/core/storage/cache_manager.dart';

class RegistrationController {
  Future<bool> saveDate (
      String fullName,
      String email,
      String password,
      ) async {
    try {
      CacheManager.saveData(key: 'fullName',value: fullName);
      CacheManager.saveData(key: 'email',value: email);
      CacheManager.saveData(key: 'password',value: password);
      return true;
    } catch (error) {
      print('Error Massage; $error');
      return false;
    }
  }
}