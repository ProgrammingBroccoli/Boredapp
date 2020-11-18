import 'package:bored_app_dcc/services/Networker.dart';
import 'package:flutter/material.dart';

const boredURL = 'https://www.boredapi.com/api/';

class ActivityModel {
  Future<dynamic> getActivity() async {
    var url = boredURL + 'activity/';
    Networker networker = new Networker(url);
    var Data = await networker.getData();
    return Data;
  }

  Future<dynamic> getCustomActivity(
      String type, int participants, double price, double accessibility) async {
    String sParticipants = participants.toString();
    String sPrice = price.toString();
    String sAccessibility = accessibility.toString();
    var url = boredURL +
        'activity?type=' +
        type +
        '&participants=' +
        sParticipants +
        '&price=' +
        sPrice +
        '&accessibility=' +
        sAccessibility;
    Networker networker = new Networker(url);
    var Data = await networker.getData();
    return Data;
  }
}
