
import 'package:attached/ui/signInView/sign_in_at_view.dart';
import 'package:flutter/material.dart';

import 'ui/attachView/attach_view.dart';
import 'ui/signInView/sign_in_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: SignInView.id,
      routes: {
        SignInView.id: (context) => SignInView(),
        SignInAtView.id: (context) => SignInAtView(),
        AttachView.id: (context) => AttachView()
      },
    );
  }
}
