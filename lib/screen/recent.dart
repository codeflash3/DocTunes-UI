import 'package:flutter/material.dart';

class Recent extends StatelessWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Recents Will Be Shown Here.",
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
