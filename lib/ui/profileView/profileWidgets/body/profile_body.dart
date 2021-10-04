import 'package:attached/ui/profileView/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class ProfileBody extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return SingleChildScrollView(
      child: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(Icons.person_outline_outlined),
            title: Text('Personal Info'),
            subtitle: Text('Name, phone, birthday'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite_border_outlined),
            title: Text('Favorites'),
            subtitle: Text('Colors, music, food'),
            trailing: Icon(Icons.arrow_forward),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.format_list_bulleted_outlined),
            title: Text('Lists'),
            subtitle: Text('Wish, bucket, to-do'),
            trailing: Icon(Icons.arrow_forward),
          ),

          /*Container(
            margin:EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCol(field: 'First Name', value: personaService.firstName ?? '-'),
                InfoCol(field: 'Last Name', value: personaService.lastName ?? '-')
              ],
            ),
          ),*/
          /*Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextQuality(hint: 'Wish list'),
              TextQuality(hint: 'Favorite color'),
              TextQuality(hint: 'Favorite food'),
              TextQuality(hint: 'Love languages'),
              TextQuality(hint: 'Life Goals'),
            ],
          ),*/]
      ),
    );
  }
}
