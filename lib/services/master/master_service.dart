import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@singleton
class MasterService {

  Box get masterBox{
    return Hive.box('master');
  }

  /// Open the master box which will record what at sign was signed in last
  Future<void> initialize() async {
    print('opening master box');
    await Hive.openBox('master');
    print('done');
  }

  String get lastAtSign {
    //return masterBox.get('lastAtSign');
    return '@leftgoodnightandgoodluck';
  }

}
