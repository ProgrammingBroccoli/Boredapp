import 'package:bored_app_dcc/components/AccessibilityCard.dart';
import 'package:bored_app_dcc/components/ActivityCard.dart';
import 'package:bored_app_dcc/components/ParticipantsCard.dart';
import 'package:bored_app_dcc/components/PriceCard.dart';
import 'package:bored_app_dcc/screens/input_screen.dart';
import 'package:bored_app_dcc/services/Activity.dart';
import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class ActivityScreen extends StatefulWidget {
  ActivityScreen({this.activityData});

  var activityData;

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  ActivityModel activity = new ActivityModel();
  String activityText;
  String type;
  int participants;
  double price;
  String link;
  String key;
  double accessibility;

  @override
  void initState() {
    super.initState();
    price = 0.0;
    accessibility = 0.0;
    updateUI(widget.activityData);
  }

  void updateUI(dynamic activityData) {
    setState(() {
      if (activityData == null) {
        activityText = "No activity available";
        type = "Type";
        participants = 0;
        price = 0.0;
        link = "";
        key = "";
        accessibility = 0.0;
        return;
      }

      activityText = activityData['activity'];
      type = activityData['type'];
      participants = activityData['participants'];
      link = activityData['link'];
      price = activityData['price'].toDouble();
      accessibility = activityData['accessibility'].toDouble();
      key = activityData['key'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffBDD5EA),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ActivityCard(
                  Body: activityText,
                  Type: type,
                ),
                Row(
                  children: [
                    AccessibilityCard(
                      Accessibility: accessibility,
                    ),
                    PriceCard(
                      Price: price,
                    ),
                  ],
                ),
                ParticipantsCard(
                  Participants: participants,
                ),
                Container(
                  height: 50,
                ),
                DangerLineButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return InputScreen();
                      }));
                    },
                    title: "Help me find an activity"),
                Container(
                  height: 60,
                ),
                FloatingActionButton(
                  child: Icon(
                    Icons.refresh,
                    size: 50,
                    color: Colors.white,
                  ),
                  backgroundColor: kCardColor,
                  onPressed: () async {
                    var data = await activity.getActivity();
                    updateUI(data);
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
