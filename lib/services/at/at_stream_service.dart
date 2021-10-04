import 'dart:convert';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_commons/at_builders.dart';
import 'package:attached/services/services.dart';
import 'package:stacked/stacked.dart';

class AtStreamService with ReactiveServiceMixin {
  Future<void> monitor() async {
    MonitorVerbBuilder monitorVerbBuilder = MonitorVerbBuilder();
    await atProtocolService.atClient?.getLocalSecondary()?.executeVerb(monitorVerbBuilder);
  }

  Future<void> startMonitor() async {
    if (atProtocolService.atClientService?.atClientManager.atClient?.getCurrentAtSign() != null) {
      String? privateKey = atProtocolService.atClientPreference?.privateKey;

      if(privateKey != null) {

      atProtocolService.atClientService?.atClientManager.notificationService.subscribe(regex: attachedService.theirAtSign).listen((AtNotification event) {
        print('Notification: '+ event.key);
        noteService.processNoteKey(event.key);
      });
        /*await atProtocolService.atClient?.startMonitor(privateKey, (response) {
          print(response.toString());
        });*/
      }
    }
  }

  var fileLength;
  var userResponse = false;

  Future<void> _notificationCallBack(var response) async {
    print('response => $response');
    response = response.replaceFirst('notification:', '');
    var responseJson = jsonDecode(response);
    var notificationKey = responseJson['key'];
    var fromAtSign = responseJson['from'];
    var atKey = notificationKey.split(':')[1];
    atKey = atKey.replaceFirst(fromAtSign, '');
    atKey = atKey.trim();
    if (atKey == 'stream_id') {
      var valueObject = responseJson['value'];
      var streamId = valueObject.split(':')[0];
      var fileName = valueObject.split(':')[1];
      fileLength = valueObject.split(':')[2];
      fileName = utf8.decode(base64.decode(fileName));

      //userResponse = await acceptStream(fromAtSign, fileName, fileLength);

      /*if (userResponse == true) {
        await atProtocolService.atClientImpl.sendStreamAck(
            streamId,
            fileName,
            int.parse(fileLength),
            fromAtSign,
            _streamCompletionCallBack,
            _streamReceiveCallBack);
      }*/
    }
  }

/*  // acknowledge file transfer
  Future<bool> acceptStream(
      String atsign, String filename, String filesize) async {
    print("from:$atsign file:$filename size:$filesize");
    BuildContext context = NavService.navKey.currentContext;
    ContactProvider contactProvider =
    Provider.of<ContactProvider>(context, listen: false);

    for (AtContact blockeduser in contactProvider.blockedContactList) {
      if (atsign == blockeduser.atSign) {
        return false;
      }
    }

    if (!autoAcceptFiles &&
        app_lifecycle_state != null &&
        app_lifecycle_state != AppLifecycleState.resumed.toString()) {
      print("app not active $app_lifecycle_state");
      await NotificationService().showNotification(atsign, filename, filesize);
    }
    NotificationPayload payload = NotificationPayload(
        file: filename, name: atsign, size: double.parse(filesize));

    bool userAcceptance;
    if (autoAcceptFiles) {
      Provider.of<HistoryProvider>(context, listen: false).setFilesHistory(
          atSignName: payload.name.toString(),
          historyType: HistoryType.received,
          files: [
            FilesDetail(
                filePath: atClientPreference.downloadPath + '/' + payload.file,
                size: payload.size,
                fileName: payload.file,
                type: payload.file.substring(payload.file.lastIndexOf('.') + 1))
          ]);
      userAcceptance = true;
    } else {
      await showDialog(
        context: context,
        builder: (context) => ReceiveFilesAlert(
          payload: jsonEncode(payload),
          sharingStatus: (s) {
            userAcceptance = s;
            print('STATUS====>$s');
          },
        ),
      );
    }
    return userAcceptance;
  }*/
}

class FilesDetail {
  String? fileName;
  String? filePath;
  double? size;
  String? type;

  FilesDetail({
    required this.fileName,
    required this.size,
    required this.type,
    required this.filePath,
  });

  FilesDetail.fromJson(json) {
    fileName = json['file_name'].toString();
    size = double.parse(json['size'].toString());
    type = json['type'].toString();
    filePath = json['file_path'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['file_name'] = this.fileName;
    data['size'] = this.size;
    data['type'] = this.type;
    data['file_path'] = this.filePath;
    return data;
  }
}
