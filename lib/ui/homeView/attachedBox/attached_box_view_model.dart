import 'package:attached/services/services.dart';
import 'package:attached/services/user/user_service.dart';
import 'package:stacked/stacked.dart';

class AttachedBoxViewModel extends ReactiveViewModel{

  bool expanded = false;

  void initialize(){

  }

  void toggleExpanded(){
    expanded = !expanded;
    notifyListeners();
  }

  void unlink(){
    attachedService.theirAtSign = null;
    expanded = false;

    userService.userBox.delete(UserService.theirAtSignKey);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  List<ReactiveServiceMixin> get reactiveServices => [attachedService,noteService];

}