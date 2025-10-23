import 'package:flutter/material.dart';
import 'package:the_app/utils/colours.dart';

class DataReciever extends StatefulWidget {
  const DataReciever({super.key});

  @override
  State<DataReciever> createState() => _DataRecieverState();
}

class _DataRecieverState extends State<DataReciever> {
  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbar,
        foregroundColor: AppColor.appbarText,
        title: Text(
          "Navigation data reciever",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("The message from first page : $message"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, "Clicked Back Button");
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: AppColor.normalText,
                  backgroundColor: AppColor.normalText_2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(100, 50),
                ),
                child: Text("Go Back"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
