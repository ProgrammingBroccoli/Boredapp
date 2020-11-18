import 'package:bored_app_dcc/components/AccessibilityCard.dart';
import 'package:bored_app_dcc/components/ActivityCard.dart';
import 'package:bored_app_dcc/components/ParticipantsCard.dart';
import 'package:bored_app_dcc/components/PriceCard.dart';
import 'package:bored_app_dcc/screens/input_screen.dart';
import 'package:bored_app_dcc/services/Activity.dart';
import 'package:bored_app_dcc/services/ActivityFormat.dart';
import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';

class CustomActivityScreen extends StatefulWidget {
  CustomActivityScreen({this.activityData});

  var activityData;

  @override
  _CustomActivityScreenState createState() => _CustomActivityScreenState();
}

class _CustomActivityScreenState extends State<CustomActivityScreen> {
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
    updateUI(widget.activityData);
  }

  void updateUI(dynamic activityData) {
    print(activityData);
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
      price = makeDouble(activityData['price']);
      link = activityData['link'];
      key = activityData['key'];
      accessibility = makeDouble(activityData['accessibility']);
    });
    print(activityData);
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
          ),
        ));
  }

  double makeDouble(dynamic input) {
    if (input == 0) {
      return 0.0;
    } else if (input == 0.1) {
      return 0.1;
    } else if (input == 0.2) {
      return 0.2;
    } else if (input == 0.3) {
      return 0.3;
    } else if (input == 0.4) {
      return 0.4;
    } else if (input == 0.5) {
      return 0.5;
    } else if (input == 0.6) {
      return 0.6;
    } else if (input == 0.7) {
      return 0.7;
    } else if (input == 0.8) {
      return 0.8;
    } else if (input == 0.9) {
      return 0.9;
    } else if (input == 1) {
      return 1.0;
    }

//    switch (input) {
//      case 0:
//        {
//          return 0.0;
//        }
//      case 0.1:
//        {
//          return 0.1;
//        }
//      case 0.2:
//        {
//          return 0.2;
//        }
//      case 0.3:
//        {
//          return 0.3;
//        }
//      case 0.4:
//        {
//          return 0.4;
//        }
//      case 0.5:
//        {
//          return 0.5;
//        }
//      case 0.6:
//        {
//          return 0.6;
//        }
//      case 0.7:
//        {
//          return 0.7;
//        }
//      case 0.8:
//        {
//          return 0.8;
//        }
//      case 0.9:
//        {
//          return 0.9;
//        }
//      case 1:
//        {
//          return 1.0;
//        }
//    }
  }
}
