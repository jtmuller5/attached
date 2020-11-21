import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class AtProtocolServer{
  AtClientService atClientServiceInstance;
  AtClientImpl atClientInstance;

  Future<bool> onboard({String atsign}) async {
    atClientServiceInstance = AtClientService();
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    var path = appDocumentDirectory.path;
    var atClientPreference = AtClientPreference()
      ..isLocalStoreRequired = true
      ..commitLogPath = path
      ..syncStrategy = SyncStrategy.IMMEDIATE
      ..rootDomain = 'test.do-sf2.atsign.zone'
      ..hiveStoragePath = path;
    var result = await atClientServiceInstance.onboard(
        atClientPreference: atClientPreference,
        atsign: atsign,
        namespace: 'server_demo');
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }

  ///Returns `false` if fails in authenticating [atsign] with [cramSecret]/[privateKey].
  Future<bool> authenticate(String atsign,
      {String cramSecret, String privateKey}) async {
    var result = await atClientServiceInstance.authenticate(atsign,
        cramSecret: cramSecret);
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }

  Future<String> get(AtKey atKey) async {
    var result = await atClientInstance.get(atKey);
    return result.value;
  }

  Future<bool> put(AtKey atKey, String value) async {
    return await atClientInstance.put(atKey, value,);
  }
/*
  Future<bool> putAttach(AtKey atKey, String value) async {
    return await this.atClientInstance.pu(atKey, value);
  }*/

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