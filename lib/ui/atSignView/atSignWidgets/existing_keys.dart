import 'package:attached/app/themes.dart';
import 'package:attached/ui/atSignView/at_sign_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ExistingKeys extends ViewModelWidget<AtSignViewModel>{
  final AtSignViewModel model;

  ExistingKeys(this.model);

  @override
  Widget build(BuildContext context, viewModel) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Use Existing Keys',
            style: attachedStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width*(2/3),
              child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text('Please select the zip file containing your keys and QR code',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.black),)),
            ),
          ),
          OutlineButton(
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.file_upload),
                    Text('Coming Soon'),
                    //Text('Locate Keys'),
                  ],
                ),
              ),
              onPressed: true?null:() async {
                //model.keyFile = await FilePicker.platform.pickFiles();
              }),
        ],
      ),
    );
  }
}