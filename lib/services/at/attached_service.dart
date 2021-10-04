import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';

/// Manages the current user's at sign and that of the user they
/// are attached to

@singleton
class AttachedService with ReactiveServiceMixin  {

  String? myAtSign;
  String? theirAtSign;

  void setMyAtSign(String newVal){
    myAtSign = newVal;
  }

  void setTheirAtSign(String newVal){
    theirAtSign = newVal;
  }
}
