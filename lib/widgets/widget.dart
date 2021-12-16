import 'package:flutter/material.dart';

class MenuBar extends StatefulWidget {
  final List<String> menuname;
  final ValueChanged<int> onSelectedItem;


  const MenuBar({Key? key,required this.menuname,required this.onSelectedItem}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  // List<String> menuname = ['Home', 'Recents', 'Settings'];
  int activeindex=0;
  Widget menu( String str, double ex, var h, var w,int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          activeindex=index;
        });
        widget.onSelectedItem(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: activeindex==index
          ? Colors.blue:Colors.transparent,
        ),
        child: Center(child:Text(
          str,
          style: TextStyle(fontSize: 18, color: activeindex==index
              ? Colors.white:Colors.black,),
        ),
      ),
      ),
    );
  }

  List<Widget> menulist(var h, var w) {
    return widget.menuname.map((e) => menu( e, 20, h, w,widget.menuname.indexOf(e))).toList();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
          width: double.infinity,
          // height: 40,
          decoration: BoxDecoration(
            color: Color(0xffd6edfb),
            borderRadius: BorderRadius.circular(23),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...menulist(h, w),
            ],
          )),
    );
  }
}
