import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:bored_app_dcc/utilities/screen.dart';
import 'package:flutter/cupertino.dart';

class ActivityCard extends StatelessWidget {
  ActivityCard({@required this.Body, this.Type});

  final String Body;
  final String Type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: SdisplayWidth(context) * 0.90,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
              child: Container(
                decoration: BoxDecoration(color: Color(0xffFE5F55)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    Type,
                    style: kCardTypeStyle,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40, 30, 40, 40),
              child: Text(
                Body,
                style: kCardHeaderTextStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
