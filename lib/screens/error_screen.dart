import 'package:bored_app_dcc/services/Activity.dart';
import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'activity_screen.dart';

class ErrorScreen extends StatefulWidget {
  @override
  _ErrorScreenState createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBDD5EA),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "NO ACTIVITY COULD BE FOUND",
            style: kErrorStyle,
          ),
          FloatingActionButton(
            child: Icon(
              Icons.keyboard_backspace,
              size: 50,
              color: Colors.white,
            ),
            backgroundColor: kCardColor,
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
