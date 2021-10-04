import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/attachedBox/attached_empty.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'attached_box_view_model.dart';
import 'attached_user.dart';

class AttachedBoxView extends StatelessWidget {

  const AttachedBoxView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttachedBoxViewModel>.reactive(
      viewModelBuilder: () => AttachedBoxViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              children: [
                Row(
                  children: [
                    Switch(
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        value: noteService.showSent,
                        onChanged: (value){
                          noteService.toggleSent();
                    }),
                    Text(noteService.showSent ? 'Sent' : 'Received'),
                  ],
                ),
                ViewModelBuilder<AttachedBoxViewModel>.reactive(
                    viewModelBuilder: () => AttachedBoxViewModel(),
                    builder: (context, model, child) {
                      return GestureDetector(
                        onTap: () {
                          if(attachedService.theirAtSign != null){
                            model.toggleExpanded();
                          } else {
                            appRouter.push(AttachViewRoute());
                          }
                        },
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: attachedService.theirAtSign != null
                              ? AttachedUser()
                              : AttachedEmpty(),
                        ),
                      );
                    }),
              ],
            ));
      },
    );
  }
}
