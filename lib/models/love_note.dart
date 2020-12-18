import 'package:flutter/material.dart';

class LoveNote {
  String message;
  Color mainColor;
  String sender;
  String date;
  List<String> images = [];
  String location = '';
  List<String> gifts = [];

  LoveNote({
    this.message,
    this.mainColor,
    this.sender,
    this.date,
    this.images,
    this.location,
    this.gifts,
  });
}
