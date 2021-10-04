import 'dart:io';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_commons.dart';
import 'package:at_onboarding_flutter/services/onboarding_service.dart';
import 'package:attached/app/app_router.dart';
import 'package:attached/app/app_router.gr.dart';
import 'package:attached/app/at_constants.dart';
import 'package:attached/services/services.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter/material.dart';

@singleton
class AtProtocolService {

  /// The current AtClientService used to initialize the AtClient
  AtClientService? get atClientService{
    return OnboardingService.getInstance().atClientServiceMap[attachedService.myAtSign];
  }

  /// The current AtClient implementation
  AtClient? get atClient{
    return atClientService?.atClientManager.atClient;
  }

  /// The currently logged in @Sign
  String? get atSign {
    return atClient?.getCurrentAtSign();
  }

  final KeyChainManager keyChainManager = KeyChainManager.getInstance();

  /// List of @Signs available on this device
  List<String>? atSignList = [];

  AtClientPreference? atClientPreference;

  String? get currentAtSign {
    return atClientService?.atClientManager.atClient?.getCurrentAtSign();
  }

  GlobalKey<NavigatorState> navKey = GlobalKey();

  Future<AtClientPreference> getAtClientPreference() async {
    Directory appDocumentDirectory = await path_provider.getApplicationSupportDirectory();
    String path = appDocumentDirectory.path;

    AtClientPreference _atClientPreference = AtClientPreference()
      ..isLocalStoreRequired = true
      ..commitLogPath = path
      ..namespace = AtConstants.appNamespace
      ..rootDomain = AtConstants.rootDomain
      ..hiveStoragePath = path;

    atClientPreference = _atClientPreference;

    return _atClientPreference;
  }

  Future<void> status() async {
    //atClientService.atClient.getLocalSecondary();
    //atClientService.atClient.getRemoteSecondary();
    var stats = await keyChainManager.getAtsignsWithStatus();
    print('status: ' + stats.toString());
  }

  /// Get all @Signs that this device has used to sign in
  Future<void> getSigns() async {
    atSignList = await keyChainManager.getAtSignListFromKeychain();
    print('Existing at signs: ' + atSignList.toString());
  }

  /// make the selected atSign the primary one before onboarding again
  Future<void> makePrimary(String atSign) async {
    await keyChainManager.makeAtSignPrimary(atSign);
  }

  ///Fetches atsign from device keychain.
  String? getAtSign() {
    return atClientService?.atClientManager.atClient?.getCurrentAtSign();
  }

  Future<String?> get(AtKey atKey) async {
    var result = await atClient?.get(atKey);
    return result?.value;
  }

  Future<bool> put(AtKey atKey, String value) async {
    return await atClient?.put(
          atKey,
          value,
        ) ??
        false;
  }

  Future<bool> delete(AtKey atKey) async {
    return await atClient?.delete(atKey) ?? false;
  }

  ///Fetches privatekey for [atsign] from device keychain.
  /*Future<String?> getPrivateKey(String atsign) async {
    return await atClientImpl?.getPrivateKey(atsign);
  }*/

  Future<List<String>> getKeys({String? sharedBy}) async {
    return await atClient?.getKeys(regex: 'server_demo', sharedBy: sharedBy) ?? [];
  }

  /*Future<bool>? saveKeys(String publicKey, String privateKey) {
    return atClient?.persistPublicKey(publicKey);
  }*/

  /// Clear all At Protocol values and return to the initial sign in view
  Future<void> logout(BuildContext context) async {

    String? firstKey = atSignList?.firstOrNull;

    String? currentAtSign = await keyChainManager.getAtSign();
    print('Logging out of: '+ currentAtSign.toString());
    if(currentAtSign != null) await keyChainManager.deleteAtSignFromKeychain(currentAtSign);

    atClientPreference = null;

    await appRouter.pushAndPopUntil(SignInViewRoute(),predicate: (route) => false);
  }
}
