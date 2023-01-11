import 'package:flutter/material.dart';

class GlobalFn {
  BuildContext context;
  Function(VoidCallback) setState;
  GlobalFn(this.context, this.setState);

  String locale = '';
  double screenHeight = 0.0;
  double screenWidth = 0.0;
}
