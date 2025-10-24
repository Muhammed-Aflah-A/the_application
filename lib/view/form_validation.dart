import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:the_app/utils/colours.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  final formKey = GlobalKey<FormState>();
  bool checked1 = false;
  String? maritalStatus;
  bool theme = false;
  double currentValue = 0;
  final dobController = TextEditingController();
  final timeController = TextEditingController();
  String? date;
  String? time;
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
          child: ListView(
            shrinkWrap: true,
            children: [
              Form(
                key: formKey,
                child: Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 3),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[50],
                  ),
                  width: double.infinity,
                  child: Column(
                    children: [
                      TextFormField(
                        maxLength: 10,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.black),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: Icon(Icons.verified, color: Colors.blue),
                          prefixText: "Mr/Mrs ",
                          suffixText: "@gmail.com",
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixStyle: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                          suffixStyle: TextStyle(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      CheckboxListTile(
                        value: checked1,
                        onChanged: (value) {
                          setState(() {
                            checked1 = value!;
                          });
                        },
                        activeColor: Colors.green,
                        title: Text(
                          "Terms and Conditions",
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(
                          "Agree to continue",
                          style: TextStyle(color: Colors.black),
                        ),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                      SizedBox(height: 10),
                      RadioGroup(
                        groupValue: maritalStatus,
                        onChanged: (value) {
                          setState(() {
                            maritalStatus = value;
                          });
                        },
                        child: Column(
                          children: [
                            RadioListTile(
                              value: "Bhachelor",
                              title: Text(
                                "Bachelor",
                                style: TextStyle(color: Colors.black),
                              ),
                              activeColor: Colors.green,
                            ),
                            RadioListTile(
                              value: "Married",
                              title: Text(
                                "Married",
                                style: TextStyle(color: Colors.black),
                              ),
                              activeColor: Colors.red,
                            ),
                            SizedBox(height: 10),
                            SwitchListTile(
                              title: Text(
                                "Dark Theme",
                                style: TextStyle(color: Colors.black),
                              ),
                              subtitle: Text(
                                "Click to On",
                                style: TextStyle(color: Colors.black),
                              ),
                              value: theme,
                              onChanged: (value) {
                                setState(() {
                                  theme = value;
                                });
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              activeThumbColor: Colors.green,
                              inactiveThumbColor: Colors.red,
                            ),
                            SizedBox(height: 10),
                            DropdownButtonFormField(
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Select gender",
                                prefixIcon: Icon(Icons.list),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                              ),
                              items: ["Male", "Female", "Other"].map((gender) {
                                return DropdownMenuItem(
                                  value: gender,
                                  child: Text(gender),
                                );
                              }).toList(),
                              onChanged: (value) {},
                            ),
                            SizedBox(height: 10),
                            Slider(
                              value: currentValue,
                              min: 0,
                              max: 100,
                              onChanged: (value) {
                                setState(() {
                                  currentValue = value;
                                });
                              },
                              divisions: 100,
                              label: currentValue.toStringAsFixed(0),
                              activeColor: Colors.green,
                              inactiveColor: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: dobController,
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Date of birth",
                                prefixIcon: Icon(Icons.calendar_today),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                              ),
                              readOnly: true,
                              onTap: () async {
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2000, 1, 1),
                                  firstDate: DateTime(1975),
                                  lastDate: DateTime.now(),
                                );
                                if (picked != null) {
                                  setState(() {
                                    date = DateFormat(
                                      "EEEE, dd-MMM-yyyy",
                                    ).format(picked);
                                    dobController.text = date!;
                                  });
                                }
                              },
                            ),
                            SizedBox(height: 10),
                            TextFormField(
                              controller: timeController,
                              decoration: InputDecoration(
                                filled: true,
                                labelText: "Time",
                                prefixIcon: Icon(Icons.calendar_today),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 3,
                                  ),
                                ),
                              ),
                              readOnly: true,
                              onTap: () async {
                                TimeOfDay? picked = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                if (picked != null) {
                                  setState(() {
                                    time = picked.format(context);
                                    timeController.text = time!;
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
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
