import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:bored_app_dcc/utilities/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PriceCard extends StatelessWidget {
  PriceCard({@required this.Price});

  final double Price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(15.0),
        width: SdisplayWidth(context) * 0.425,
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  "Price",
                  style: kCardHeaderTextStyle,
                )),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: new CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 13.0,
                  animation: true,
                  percent: Price,
                  center: new Text(
                    Price.toString(),
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  footer: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: new Text(
                      "Price",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Color(0xffFE5F55),
                )),
          ],
        ),
      ),
    );
  }
}
