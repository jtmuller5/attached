import 'package:flutter/material.dart';

class AttachView extends StatelessWidget {
  static const String id = "attach_view";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(flex: 2,),
            Expanded(
              flex: 2,
              child: Text(
                'Who are you \natt@ched to?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 36),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '@',
                          style: TextStyle(fontSize: 36, color: Colors.white),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      filled: true,
                      fillColor: Colors.red.shade300,
                      focusColor: Colors.red,
                      hintText: "Someone special....",
                  hintStyle: TextStyle(
                    color: Colors.white38
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
