import 'package:flutter/material.dart';

// Box Decorations

BoxDecoration fieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[200]);

BoxDecoration disabledFieldDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(5), color: Colors.grey[100]);

// Field Variables

const double fieldHeight = 55;
const double smallFieldHeight = 40;
const double inputFieldBottomMargin = 30;
const double inputFieldSmallBottomMargin = 0;
const EdgeInsets fieldPadding = const EdgeInsets.symmetric(horizontal: 15);
const EdgeInsets largeFieldPadding =
    const EdgeInsets.symmetric(horizontal: 15, vertical: 15);

// Text Variables
const TextStyle buttonTitleTextStyle = const TextStyle(
    fontWeight: FontWeight.w700, color: Color.fromRGBO(66, 66, 66, 1.0));

const Color primaryBackgroundColor = Color.fromRGBO(28, 28, 44, 1.0);
