import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData myTheme(BuildContext context)=>ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  sliderTheme: SliderThemeData(
    trackHeight: 16,
  ),
);