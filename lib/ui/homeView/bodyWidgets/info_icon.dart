import 'package:attached/app/app_router.dart';
import 'package:attached/ui/reusables/shadow_icon.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

Widget InfoIcon(BuildContext context) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShadowIcon(
        icon: Icons.info_outline,
        shadowColor: Colors.black,
        iconColor: Colors.white,
      ),
    ),
    onTap: (){
      showDialog(
          context: context,
          builder:(context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                    'The @ Protocol ensures that only you and the att@ched person can see these notes. \n\nNot big brother. \n\nNot the FBI. \n\nJust the 2 of you'),
              ],
            ),
            title: Text('True Privacy'),
            actions: [
              TextButton(
                child: Text('Sweet'),
                onPressed: () => appRouter.pop(),
              ),
            ],
          ));
    },
  );
}