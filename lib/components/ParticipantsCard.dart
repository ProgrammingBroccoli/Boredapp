import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ParticipantsCard extends StatelessWidget {
  ParticipantsCard({@required this.Participants});

  final int Participants;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: kCardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.people,
                size: 50,
              ),
              Container(
                width: 10,
              ),
              Text(
                Participants.toString(),
                style: kCardParticipantsStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
