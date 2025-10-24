import 'package:flutter/material.dart';
import 'package:the_app/utils/colours.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int num = 0;
  void increaseButton() {
    setState(() {
      num++;
    });
  }

  void decrementButton() {
    setState(() {
      if (num > 0) {
        num--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appbar,
        foregroundColor: AppColor.appbarText,
        title: Text(
          "Flutter Fundementals",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            backgroundColor: AppColor.buttonColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              increaseButton();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'decrement',
            backgroundColor: AppColor.buttonColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: () {
              decrementButton();
            },
            child: Icon(Icons.remove),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber[50],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Column 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.normalText_2,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Column 2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.normalText_2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue[50],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Row 1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.normalText_2,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Row 2",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColor.normalText_2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 3),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey[50],
                ),
                child: Center(
                  child: Text(
                    "Count = $num",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: AppColor.normalText_2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
