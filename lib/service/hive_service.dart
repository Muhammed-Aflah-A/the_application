import 'package:the_app/model/hive_user.dart';

abstract class HiveService {
  Future<void> addUser(HiveUser user);
}
