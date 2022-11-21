import 'package:flutter/material.dart';
import 'package:wordle/Data/Data.dart';
import 'package:wordle/Pages/MainPage.dart';
import 'dart:html';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool controller = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "AYARLAR",
          style: TextStyle(fontSize: 30, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: close,
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ))
        ],
      ),
      body: Center(
        child: Container(
          width: Data.getWidth(context),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Zor Mod",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                      Container(
                          height: 40,
                          width: Data.getWidth(context) / 1.5,
                          child: Text(
                              "Ortaya çıkan herhangi bir harf kullanılmak zorundadır."))
                    ],
                  ),
                  Spacer(),
                  Switch(
                    value: controller,
                    onChanged: (value) {
                      setState(() {
                        controller = !controller;
                      });
                    },
                    activeTrackColor: Colors.green,
                    activeColor: Colors.white,
                    inactiveTrackColor: Colors.grey,
                    inactiveThumbColor: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getMode() async {
    controller = hardMode!;
  }

  close() async {
    hardMode = controller;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => MainPage()));
  }
}
