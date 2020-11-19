import 'package:attached/ui/attachView/attach_view_model.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AttachView extends StatelessWidget {
  static const String id = "attach_view";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttachViewModel>.reactive(
      viewModelBuilder: () => AttachViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(
                flex: 2,
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Who are you \natt@ched to?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 36),
                ),
              ),
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (value){
                      model.updateAttachedString(value);
                    },
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: Icon(Icons.alternate_email,color: Colors.white,),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        filled: true,
                        fillColor: Colors.red.shade300,
                        focusColor: Colors.red,
                        hintText: "Someone special....",
                        hintStyle: TextStyle(color: Colors.white38)),
                  ),
                ),
              ),
              RaisedButton(
                child: Text('Attach'),
                onPressed: () {
                  model.updateAttached();
                  Navigator.pushNamedAndRemoveUntil(context, HomeView.id, (route) => route.isFirst);
                  print("attach");
                },
              ),
              Spacer(
                flex: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
