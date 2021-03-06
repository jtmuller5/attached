import 'dart:developer';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:attached/services/services.dart';
import 'package:attached/services/user/user_service.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

@singleton
class AtProtocolService{

  AtClientService atClientServiceInstance;
/*  AtClientService get atClientServiceInstance{
    return AtClientService();
  }*/

  AtClientImpl atClientInstance;
  /*AtClientImpl get atClientInstance{
    return atClientServiceInstance.atClient;
  }*/

 /* String get authState{
    var stream = atClientServiceInstance.
  }*/

  String get currentAtSign{
    return atClientInstance.currentAtSign;
  }

  Future<bool> onboard({String atsign}) async {
    atClientServiceInstance = AtClientService();
    var appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
    var path = await appDocumentDirectory.path;

    log('setting at client prefs');
    var atClientPreference = AtClientPreference()
      ..isLocalStoreRequired = true
      ..commitLogPath = path
      ..syncStrategy = SyncStrategy.IMMEDIATE
      ..rootDomain = 'test.do-sf2.atsign.zone'
      ..hiveStoragePath = path;

    log('at client onboarding');
    var result = await atClientServiceInstance.onboard(
        atClientPreference: atClientPreference,
        atsign: atsign,
        namespace: 'server_demo');

    if(result){
      print('adding at sign to box - onboard');
      await userService.userBox.put(UserService.atSignKey, atsign);
    }

    log('updating at client');
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }

  ///Returns `false` if fails in authenticating [atsign] with [cramSecret]/[privateKey].
  Future<bool> authenticate(String atsign,
      {String cramSecret, String privateKey}) async {
    var result = await atClientServiceInstance.authenticate(atsign,
        cramSecret: cramSecret);

    return result;
  }

  Future<String> get(AtKey atKey) async {
    var result = await atClientInstance.get(atKey);
    return result.value;
  }

  Future<bool> put(AtKey atKey, String value) async {
    return await atClientInstance.put(atKey, value,);
  }

  Future<bool> delete(AtKey atKey) async {
    return await atClientInstance.delete(atKey);
  }

  Future<List<String>> getKeys({String sharedBy}) async {
    return await atClientInstance
        .getKeys(regex: 'server_demo', sharedBy: sharedBy);
  }

  Future<bool> saveKeys(String publicKey, String privateKey) {
    return atClientInstance.persistPublicKey(publicKey);
  }
}