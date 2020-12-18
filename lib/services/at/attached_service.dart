import 'dart:developer';

import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:attached/models/love_note.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:at_commons/at_commons.dart';

@singleton
class AttachedService extends ChangeNotifier {
  String myAtSign;
  String theirAtSign;

  String mySign;
  String theirSign; // No @ symbol

}
