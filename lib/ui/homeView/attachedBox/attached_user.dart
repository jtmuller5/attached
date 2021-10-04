import 'package:attached/app/themes.dart';
import 'package:attached/services/services.dart';
import 'package:attached/ui/homeView/attachedBox/attached_box_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AttachedUser extends ViewModelWidget<AttachedBoxViewModel> {

  @override
  Widget build(BuildContext context, AttachedBoxViewModel model) {

    return AnimatedContainer(
      width: 150,
      duration: Duration(milliseconds: 600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.blueGrey,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              'Attached To',
              style: TextStyle(
                fontSize: 10,
                  letterSpacing: 2, fontWeight: FontWeight.w300),
            ),
          ),
          Hero(
            tag: 'attached',
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  attachedService.theirAtSign ?? '-',
                  style: attachedStyle.copyWith(
                      color: Colors.white, fontSize: 28),
                ),
              ),
            ),
          ),

          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: model.expanded?40:0,
            width: 150,
            margin: EdgeInsets.only(top: 8,bottom: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: 'Attached Profile',
                  icon: Icon(Icons.person,
                    size: model.expanded?30:0,
                    color: Colors.white,), onPressed: () {  },
                  ),
                IconButton(
                  tooltip: 'Attached Stats',
                  icon: Icon(Icons.insert_chart_outlined_rounded,
                    size: model.expanded?30:0,
                    color: Colors.white,), onPressed: () {  },
                ),
                IconButton(
                  tooltip: 'Unattach',
                  icon: Icon(Icons.link_off,
                    size: model.expanded?30:0,
                    color: Colors.white,), onPressed: () {
                  // test
                  model.unlink();
                },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

}