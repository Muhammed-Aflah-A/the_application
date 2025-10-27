import 'package:flutter/material.dart';
import 'package:the_app/utils/colours.dart';

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  @override
  Widget build(BuildContext context) {
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
        onPressed: () {},
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
