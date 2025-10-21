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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          increaseButton();
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.amber[50],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Column 1"), Text("Column 2")],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.blue[50],
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Row 1 "), Text("Row 2")],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.blueGrey[50],
                ),
                child: Center(child: Text("Count = $num")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
