import 'package:attached/app/themes.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'attached_box_view_model.dart';

class AttachedEmpty extends ViewModelWidget<AttachedBoxViewModel> {

  @override
  Widget build(BuildContext context, AttachedBoxViewModel model) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
        color: Colors.blueGrey,
      ),
      child: Column(
        children: [
          Text(
            'Tap to Attach',
            style: attachedStyle.copyWith(
                color: Colors.white, fontSize: 22),
          ),
        ],
      ),
    );
  }

}