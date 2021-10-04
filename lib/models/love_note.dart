import 'package:flutter/material.dart';

class LoveNote {
  String? key;
  String? message;
  Color? mainColor;
  String sender;
  String date;
  String? attachmentType; // Image, Location, Link
  dynamic attachmentContent;

  LoveNote({
    this.key,
    this.message,
    this.mainColor,
    required this.sender,
    required this.date,
    this.attachmentType,
    this.attachmentContent
  });
}
