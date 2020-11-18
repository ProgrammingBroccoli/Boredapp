import 'package:bored_app_dcc/components/InputCard.dart';
import 'package:bored_app_dcc/screens/custom_activity_screen.dart';
import 'package:bored_app_dcc/screens/error_screen.dart';
import 'package:bored_app_dcc/services/Activity.dart';
import 'package:bored_app_dcc/utilities/constants.dart';
import 'package:bored_app_dcc/utilities/screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  @override
  void initState() {
    super.initState();
  }

  String inputType;
  double inputAccessibility = 0.1;
  int inputParticipants = 1;
  double inputPrice = 0.1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBDD5EA),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.all(15.0),
                width: SdisplayWidth(context) * 0.90,
                decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                      child: Text(
                        "Type",
                        style: kCardHeaderTextStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 40),
                      child: DropdownButton<String>(
                        value: inputType,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: kMainTextXolor, fontSize: 22),
                        underline: Container(
                          height: 2,
                          color: kRed,
                        ),
                        onChanged: (String newvalue) {
                          setState(() {
                            inputType = newvalue;
                          });
                        },
                        items: [
                          'recreational',
                          'education',
                          'relaxation',
                          'music',
                          'cooking'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                width: SdisplayWidth(context) * 0.90,
                decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Accessibilty",
                          style: kCardHeaderTextStyle,
                        ),
                      ),
                    ),
                    Text(
                      inputAccessibility.toString(),
                      style: kNumber,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xffFE5F55),
                            inactiveTrackColor: Color(0xffFE8D85)),
                        child: Slider(
                          value: inputAccessibility,
                          min: 0,
                          max: 1,
                          divisions: 10,
                          label: inputAccessibility.toString(),
                          onChanged: (double value) {
                            setState(() {
                              inputAccessibility = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                width: SdisplayWidth(context) * 0.90,
                decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Participants",
                          style: kCardHeaderTextStyle,
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                          padding: const EdgeInsets.fromLTRB(120, 10, 40, 40),
                          child: Row(
                            children: [
                              FloatingActionButton(
                                heroTag: "btn-",
                                onPressed: () {
                                  setState(() {
                                    removeParticipant();
                                  });
                                },
                                backgroundColor: kRed,
                                mini: true,
                                child: Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                inputParticipants.toString(),
                                style: kParticipantsNr,
                              ),
                              FloatingActionButton(
                                heroTag: "btn+",
                                onPressed: () {
                                  setState(() {
                                    addParticipant();
                                  });
                                },
                                backgroundColor: kRed,
                                mini: true,
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 5, 15, 15),
                width: SdisplayWidth(context) * 0.90,
                decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 20, 5, 5),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Price",
                          style: kCardHeaderTextStyle,
                        ),
                      ),
                    ),
                    Text(
                      inputPrice.toString(),
                      style: kNumber,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 20),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Color(0xffFE5F55),
                            inactiveTrackColor: Color(0xffFE8D85)),
                        child: Slider(
                          value: inputPrice,
                          min: 0,
                          max: 1,
                          divisions: 10,
                          label: inputAccessibility.toString(),
                          onChanged: (double value) {
                            setState(() {
                              inputPrice = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    heroTag: "backbtn",
                    child: Icon(
                      Icons.arrow_back,
                      size: 40,
                      color: Colors.white,
                    ),
                    backgroundColor: kCardColor,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "acceptbtn",
                    child: Icon(
                      Icons.assignment_turned_in,
                      size: 40,
                      color: Colors.white,
                    ),
                    backgroundColor: kCardColor,
                    onPressed: () async {
                      ActivityModel activityHandler = new ActivityModel();
                      var data = await activityHandler.getCustomActivity(
                          inputType,
                          inputParticipants,
                          inputPrice,
                          inputAccessibility);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        if (data['activity'] != null) {
                          return CustomActivityScreen(
                            activityData: data,
                          );
                        } else {
                          return ErrorScreen();
                        }
                      }));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addParticipant() {
    if (inputParticipants < 5) {
      inputParticipants++;
    }
  }

  void removeParticipant() {
    if (inputParticipants > 1) {
      inputParticipants--;
    }
  }
}
