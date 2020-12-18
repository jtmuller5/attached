import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextQuality extends StatelessWidget{
  final String hint;

  const TextQuality({Key key, this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: hint
        ),
      ),
    );
  }

}