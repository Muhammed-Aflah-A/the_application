import 'package:hive_flutter/hive_flutter.dart';
part 'hive_user.g.dart';
@HiveType(typeId: 0)
class HiveUser {
  @HiveField(0)
  String? fullName;
  @HiveField(1)
  String? gmail;
  HiveUser({
    required this.fullName,
    required this.gmail,
  });
}
