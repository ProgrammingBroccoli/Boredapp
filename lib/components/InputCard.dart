import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:bored_app_dcc/utilities/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class InputCard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: SdisplayWidth(context) * 0.90,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Text(
                "Type",
                style: kCardHeaderTextStyle,
              ),
            ),
            Row(
              children: [
                Column(
                  children: [],
                ),
                Column(
                  children: [],
                ),
                Column(
                  children: [],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
