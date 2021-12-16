import 'package:doctunes/screen/home.dart';
import 'package:doctunes/screen/recent.dart';
import 'package:doctunes/screen/settings.dart';
import 'package:doctunes/widgets/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  static String id = "mainscreen";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> menuname = ['Home', 'Recents', 'Settings'];
  int _currIndex = 0;

  Widget getScreen(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Recent();
      case 2:
        return Settings();
      default:
        return Home();
    }
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.1),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Container(
            // color: Colors.blue,
            margin: EdgeInsets.only(top: h * 0.021),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.grid_view_rounded,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {},
                ),
                Container(
                  padding: EdgeInsets.only(
                    bottom: 1,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 1.0, // This would be the width of the underline
                      ),
                    ),
                  ),
                  child: Text(
                    "DocTunes",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 20,
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: h * 0.04, left: w * 0.05),
            child: Text(
              "Hi Abhimanyu!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: w * 0.05, top: h * 0.01, bottom: h * 0.015),
            child: Text(
              "Good morning",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          MenuBar(
            menuname: menuname,
            onSelectedItem: (index) {
              setState(() {
                _currIndex = index;
              });
              print(menuname[index]);
            },
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Expanded(
            child: getScreen(_currIndex),
          ),
        ],
      ),
    );
  }
}
