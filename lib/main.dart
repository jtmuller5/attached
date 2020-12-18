import 'package:attached/services/getIt.dart';
import 'package:attached/services/services.dart';
import 'package:attached/services/user/user_service.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:attached/ui/newNoteView/new_note_view.dart';
import 'package:attached/ui/signInView/sign_in_at_view.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'ui/attachView/attach_view.dart';
import 'ui/signInView/sign_in_view.dart';


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies(); // Creates all necessary services for get_it
  await Hive.initFlutter();
  await initializeServices();

  runApp(MyApp(initialRoute: SignInView.id));
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print('has key: ' + userService.userBox.containsKey(UserService.atSignKey).toString());
    if(userService.userBox.containsKey(UserService.atSignKey)){
      //atProtocolService.onboard();
          return FutureBuilder(
            future:  atProtocolService.authenticate(userService.atSign),
              builder:(context, snapshot) {
                if(snapshot.hasData){
                  if(snapshot.connectionState == ConnectionState.done){
                    print('done - ${snapshot.data}');
                    if(snapshot.data){
                      return MyApp(initialRoute: HomeView.id);
                    } else{
                      return MyApp(initialRoute: SignInView.id);
                    }
                  } else{
                    return Center(child: CircularProgressIndicator(),);
                  }
                } else{
                  return MyApp(initialRoute: SignInView.id);
                }
              },
          );

    } else{
      return MyApp(initialRoute: SignInView.id);
    }
  }

}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key key, this.initialRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeService.appTheme,
      initialRoute: initialRoute,
      routes: {
        SignInView.id: (context) => SignInView(),
        SignInAtView.id: (context) => SignInAtView(),
        AttachView.id: (context) => AttachView(),
        HomeView.id: (context) => HomeView(),
        NewNoteView.id: (context) => NewNoteView()
      },
    );
  }
}
