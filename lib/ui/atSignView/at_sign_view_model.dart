import 'package:stacked/stacked.dart';

class AtSignViewModel extends BaseViewModel{

  bool showSpinner = false;

  void initialize(){

  }

  void toggleSpinner() {
    showSpinner = !showSpinner;
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}