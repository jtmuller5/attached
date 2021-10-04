import 'package:at_onboarding_flutter/utils/app_constants.dart';

class AtConstants {
  static const String WEBSITE_URL = 'https://atsign.com/';

  // for local server
  //static const String ROOT_DOMAIN = 'test.do-sf2.atsign.zone';
  // for staging server
  // static const String ROOT_DOMAIN = 'root.atsign.wtf';
  // for production server
  static String appNamespace = 'attached';
  static String rootDomain = RootEnvironment.Production.domain;

  static const String TERMS_CONDITIONS = 'https://atsign.com/terms-conditions/';
  static const String PRIVACY_POLICY = 'https://atsign.com/privacy-policy/';
}