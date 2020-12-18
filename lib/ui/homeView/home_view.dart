import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/bodyWidgets/flexible_home.dart';
import 'package:attached/ui/homeView/home_view_model.dart';
import 'package:attached/ui/newNoteView/new_note_view.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  static const String id = 'home_view';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onModelReady: (model) {
          model.initializeHome();
          //model.setLoading(false);
        },
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              body: FlexibleHome(),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: themeService.darkColor,
                  onPressed: () {
                    Navigator.pushNamed(context, NewNoteView.id,
                        arguments: model);
                  },
                  child: ShadowIcon(
                    icon: Icons.outgoing_mail,
                    shadowColor: Colors.black,
                  )),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endFloat,

              /*bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.person), onPressed: null),
                IconButton(icon: Icon(Icons.favorite_border), onPressed: null)
              ],
            ),
          ),*/
            ),
          );
        });
  }
}
