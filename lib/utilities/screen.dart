import 'package:flutter/material.dart';

Size SdisplaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double SdisplayHeight(BuildContext context) {
  debugPrint('Height = ' + SdisplaySize(context).height.toString());
  return SdisplaySize(context).height;
}

double SdisplayWidth(BuildContext context) {
  debugPrint('Width = ' + SdisplaySize(context).width.toString());
  return SdisplaySize(context).width;
}
