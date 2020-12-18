import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:flutter/material.dart';

Widget ToFromToggle(HomeViewModel model) {
  return Positioned(
    bottom: 16,
    left: 16,
    child: AnimatedOpacity(
      opacity: model.showToggle?1:0,
      duration: Duration(milliseconds: 500),
      child: Container(
        child: Column(
          children: [
            Text(
              'From: ${model.sender}',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              model.senderAt,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            SizedBox(
              width: 100,
              child: IconButton(
                icon: Icon(
                  Icons.swap_vert_circle,
                ),
                onPressed: () {
                  model.toggleSender();
                },
              ),
            ),
            Text(
              model.receiverAt,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
            Text(
              'To: ${model.receiver}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}