import 'package:flutter/material.dart';
import 'package:the_app/utils/colours.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  String backMessage = "Nothing";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbar,
        foregroundColor: AppColor.appbarText,
        title: Text(
          "Flutter Navigation",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    "flutter_navigation_2",
                    arguments: "Hello Second Page",
                  );
                  setState(() {
                    backMessage = result as String? ?? "Nothing";
                  });
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
                child: Text("Go next page"),
              ),
              SizedBox(height: 20),
              Text("The Back Message is : $backMessage"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
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
