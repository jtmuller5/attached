import 'dart:developer';

import 'package:attached/services/services.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class UserService{

  // Keys
  static const String atSignKey = 'at_sign';
  static const String theirAtSignKey = 'their_sign';

  String? get currentAtSign{
    return atProtocolService.currentAtSign;
  }

  String get userBoxId{
    return 'at_user';
  }

  Box get userBox{
    return Hive.box('at_user');
  }

  /// Open the user box and see if there's anything inside of it
  Future<void> initializeUserService() async {
    await Hive.openBox('at_user');

    print('service is user box open? ' + Hive.isBoxOpen('at_user').toString());

    /// Get the last person this user was attached to
    if(userBox.containsKey(UserService.theirAtSignKey)){
      attachedService.theirAtSign = userService.userBox.get(UserService.theirAtSignKey);
    }
  }

  String get atSign{
    return userBox.get(UserService.atSignKey);
  }

  String get theirAtSign{
    return userBox.get(UserService.theirAtSignKey);
  }
}