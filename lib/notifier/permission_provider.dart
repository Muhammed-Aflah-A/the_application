import 'package:flutter/widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionProvider with ChangeNotifier {
  PermissionStatus _status = PermissionStatus.denied;
  PermissionStatus get status => _status;
  Future<void> camPermission() async {
    _status = await Permission.camera.request();
    notifyListeners();
  }
}
