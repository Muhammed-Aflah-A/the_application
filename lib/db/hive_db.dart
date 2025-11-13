import 'package:hive_flutter/hive_flutter.dart';
import 'package:the_app/model/hive_user.dart';
import 'package:the_app/service/service_confiq.dart';

class HiveDb implements ServiceLayer {
  static const String boxName = "UserDataBox";
  static Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox<HiveUser>(boxName);
    }
  }

  @override
  Future<void> addUser(HiveUser user) async {
    final box = Hive.box<HiveUser>(boxName);
    box.put(user.gmail, user);
  }
}
