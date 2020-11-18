import 'package:bored_app_dcc/services/Activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'activity_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getActivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBDD5EA),
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }

  void getActivity() async {
    ActivityModel activityHandler = new ActivityModel();
    var data = await activityHandler.getActivity();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ActivityScreen(
        activityData: data,
      );
    }));
  }
}
