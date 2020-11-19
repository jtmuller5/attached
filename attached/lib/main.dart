
import 'package:attached/services/attached_service.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:attached/ui/signInView/sign_in_at_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'ui/attachView/attach_view.dart';
import 'ui/signInView/sign_in_view.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AttachedService>(AttachedService());
}

void main() {
  setup();
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
        AttachView.id: (context) => AttachView(),
        HomeView.id: (context) => HomeView()
      },
    );
  }
}
