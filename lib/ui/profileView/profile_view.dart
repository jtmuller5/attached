import 'package:attached/services/services.dart';
import 'package:attached/ui/profileView/profileWidgets/flexible_profile.dart';
import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  static const String id = 'profile_view';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: FlexibleProfile(),
        ),
      ),
    );
  }
}
