import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:the_app/notifier/permission_provider.dart';
import 'package:the_app/utils/colours.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    final cameraPermission = context.watch<PermissionProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbar,
        foregroundColor: AppColor.appbarText,
        title: Text(
          "Android Fundementals",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: AppColor.buttonForeground,
        backgroundColor: AppColor.buttonBg,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColor.buttonBorder_2, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        onPressed: () async {
          await cameraPermission.camPermission();
          if (cameraPermission.status.isGranted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Permission is granted",
                  style: TextStyle(color: AppColor.normalText),
                ),
                backgroundColor: AppColor.scaffoldColor,
              ),
            );
          } else if (cameraPermission.status.isDenied) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Permission is denied",
                  style: TextStyle(color: AppColor.normalText),
                ),
                backgroundColor: AppColor.scaffoldColor_2,
              ),
            );
          } else if (cameraPermission.status.isPermanentlyDenied) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(
                  "Permission Required",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: AppColor.alertText,
                  ),
                ),
                content: Text(
                  "You need to manually allow camera permission in settings.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.buttonForeground,
                          backgroundColor: AppColor.buttonBg,
                          side: BorderSide(
                            width: 3,
                            color: AppColor.buttonBorder_2,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Go back"),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: AppColor.buttonForeground,
                          backgroundColor: AppColor.buttonBg,
                          side: BorderSide(
                            width: 3,
                            color: AppColor.buttonBorder_2,
                          ),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                          await openAppSettings();
                        },
                        child: Text("Open Settings"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
