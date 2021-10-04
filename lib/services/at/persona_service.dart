import 'dart:io';
import 'dart:typed_data';

import 'package:at_client/at_client.dart';
import 'package:base2e15/base2e15.dart';
import 'package:at_client/src/client/at_client_impl.dart';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/app/at_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:at_commons/at_commons.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import '../services.dart';

/// Class to retrieve data from the user's @persona
/// Creates a separate AtClientServiceInstance in the 'persona' namespace
@singleton
class PersonaService {
  List<String> allKeys = [];

  AtClientService? personaAtClientServiceInstance;

  AtClientImpl? personaAtClientInstance;

  AtClientPreference? personaAtClientPreference;

  /// Persona information
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? aboutMe;
  String? pronoun;
  Uint8List? personaImage;

  Future<bool?> onboardPersona({String? atsign, String namespace = 'persona'}) async {
    personaAtClientServiceInstance = AtClientService();
    Directory? downloadDirectory;

    /// The directory where keys will be stored
    if (Platform.isIOS) {
      downloadDirectory = await path_provider.getApplicationDocumentsDirectory();
    }

    /// Download path varies on non-iOS platforms
    else {
      downloadDirectory = await path_provider.getExternalStorageDirectory();
    }

    final appSupportDirectory = await path_provider.getApplicationSupportDirectory();
    String path = appSupportDirectory.path;
    personaAtClientPreference = AtClientPreference();

    personaAtClientPreference!.isLocalStoreRequired = true;
    personaAtClientPreference!.commitLogPath = path;
    personaAtClientPreference!.rootDomain = AtConstants.rootDomain;
    personaAtClientPreference!.hiveStoragePath = path;
    personaAtClientPreference!.downloadPath = downloadDirectory?.path;
    personaAtClientPreference!.namespace = 'persona';

    var result = personaAtClientServiceInstance
        ?.onboard(
          atClientPreference: personaAtClientPreference!,
          atsign: atsign,
        )
        .catchError((e) => print('Error in Onboarding: $e'));
    return result;
  }

  Future<void> getAllKeys() async {
    allKeys = await personaAtClientServiceInstance?.atClientManager.atClient?.getKeys() ?? [];
    allKeys.forEach((element) {
      AtKey atKey = AtKey.fromString(element);

      print('key: ' + element);
      print('AtKey key: ' + atKey.key.toString());
      print('AtKey namespace: ' + atKey.namespace.toString());
      print('AtKey sharedBy: ' + atKey.sharedBy.toString());
      print('AtKey sharedWith: ' + atKey.sharedWith.toString());
      print('AtKey isRef: ' + atKey.isRef.toString());
    });
  }

  Future<void> getAtKeys() async {
    List<AtKey> atKeys = await personaAtClientServiceInstance?.atClientManager.atClient?.getAtKeys() ?? [];
    atKeys.forEach((atKey) {
      print('AtKey key: ' + atKey.key.toString());
      print('AtKey namespace: ' + atKey.namespace.toString());
      print('AtKey sharedBy: ' + atKey.sharedBy.toString());
      print('AtKey sharedWith: ' + atKey.sharedWith.toString());
      print('AtKey isRef: ' + atKey.isRef.toString());
    });
  }

  /// Function to get the primary pieces of information from the user's @ Persona
  Future<void> getPersonaInfo() async {
    List<String> personaKeys = await personaAtClientServiceInstance?.atClientManager.atClient?.getKeys(regex: 'persona') ?? [];

    if (personaKeys.isNotEmpty) {
      personaKeys.forEach((element) async {
        AtKey key = AtKey.fromString(element);
        AtValue? value = await personaAtClientServiceInstance?.atClientManager.atClient?.get(key);

        if (value != null) {
          print('key: ' + (key.key ?? ''));
          print('meta: ' + value.toString());
          print('value: ' + value.value.toString());
          print(value.value.runtimeType.toString());

          switch (key.key) {
            case 'firstname':
              firstName = value.value.toString();
              break;
            case 'lastname':
              lastName = value.value.toString();
              break;
            case 'image':
              if (value.value != null) {
                personaImage = Base2e15.decode(value.value);
              }
              break;
          }
        }
      });
    }
  }

  Future<void> getFirstName() async {
    List<String> personaKeys = await personaAtClientServiceInstance?.atClientManager.atClient?.getKeys(regex: 'persona') ?? [];
//AtValue value = await atProtocolService.personaAtClientServiceInstance.atClient.get(AtKey()..key = 'firstname');

    personaKeys.forEach((element) async {
      AtKey key = AtKey.fromString(element);

      print('persona key: ' + element);
      AtValue? value = await personaAtClientServiceInstance?.atClientManager.atClient?.get(key);

      print('key: ' + (key.key ?? ''));
      print('meta: ' + value.toString());
      print('value: ' + (value?.value ?? '').toString());
    });

    // print('firstname: '+value.value.toString());
  }

  Future<void> getRootServer() async {
    atProtocolService.atClient?.getRemoteSecondary();
  }
}
