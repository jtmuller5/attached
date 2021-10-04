import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'monitor_view_model.dart';

class MonitorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MonitorViewModel>.reactive(
      viewModelBuilder: () => MonitorViewModel(),
      onModelReady: (model) {
        // model.initialize();
      },
      builder: (context, model, child) {
        return Scaffold(
         appBar: AppBar(
            title: Text('Monitor'),
          ),
            body: Column(
              children: [
               RaisedButton(onPressed: (){model.startMonitor();})
              ],
            )
        );
      },
    );
  }
}