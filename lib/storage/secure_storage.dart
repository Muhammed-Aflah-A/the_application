import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:the_app/service/secure_storage_service.dart';

class SecureStorage implements SecureStorageService {
  final secureStorage = FlutterSecureStorage();
  @override
  Future<void> addPass(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }
}
