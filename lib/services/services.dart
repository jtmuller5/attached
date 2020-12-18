import 'package:attached/services/app/theme_service.dart';
import 'package:attached/services/at/at_protocol_service.dart';
import 'package:attached/services/at/attached_service.dart';
import 'package:attached/services/getIt.dart';
import 'package:attached/services/settings/settings_service.dart';
import 'package:attached/services/user/user_service.dart';

// Called after the user is authenticated since these services need to be
// Initialized on a per user basis
Future<void> initializeServices() async {
  try {
    // Throws errors if adapters are already registered
    //if(!Hive.isAdapterRegistered(1)) Hive.registerAdapter(PostAdapter());
    //if(!Hive.isAdapterRegistered(2)) Hive.registerAdapter(UserAdapter());

    await userService.initializeUserService();
  } catch(e){
    print('initializing error: ' + e.toString());
  }
}

UserService get userService {
  return getIt.get<UserService>();
}

SettingsService get userFaunaService {
  return getIt.get<SettingsService>();
}

AtProtocolService get atProtocolService {
  return getIt.get<AtProtocolService>();
}

AttachedService get attachedService {
  return getIt.get<AttachedService>();
}

ThemeService get themeService{
  return getIt.get<ThemeService>();
}