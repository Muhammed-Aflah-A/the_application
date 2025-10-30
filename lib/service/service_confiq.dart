import 'package:the_app/model/hive_user.dart';

abstract class ServiceLayer {
  Future<void> addUser(HiveUser user);
}
