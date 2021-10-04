import 'package:attached/services/app/theme_service.dart';
import 'package:attached/services/app/toast_service.dart';
import 'package:attached/services/at/at_protocol_service.dart';
import 'package:attached/services/at/attached_service.dart';
import 'package:attached/services/at/note_service.dart';
import 'package:attached/services/at/persona_service.dart';
import 'package:attached/services/getIt.dart';
import 'package:attached/services/master/master_service.dart';
import 'package:attached/services/settings/settings_service.dart';
import 'package:attached/services/user/user_service.dart';
import 'package:mullr_components/services/system_service.dart';

import 'media/media_service.dart';

// Called after the user is authenticated since these services need to be
// Initialized on a per user basis
Future<void> initializeServices() async {
  try {
    // Throws errors if adapters are already registered
    //if(!Hive.isAdapterRegistered(1)) Hive.registerAdapter(PostAdapter());
    //if(!Hive.isAdapterRegistered(2)) Hive.registerAdapter(UserAdapter());

    await userService.initializeUserService();
    await masterService.initialize();
  } catch(e){
    print('initializing error: ' + e.toString());
  }
}

AtProtocolService get atProtocolService {
  return getIt.get<AtProtocolService>();
}

AttachedService get attachedService {
  return getIt.get<AttachedService>();
}

MasterService get masterService {
  return getIt.get<MasterService>();
}

MediaService get mediaService {
  return getIt.get<MediaService>();
}

NoteService get noteService {
  return getIt.get<NoteService>();
}

PersonaService get personaService{
  return getIt.get<PersonaService>();
}

UserService get userService {
  return getIt.get<UserService>();
}

SettingsService get userFaunaService {
  return getIt.get<SettingsService>();
}

SystemService get systemService {
  return getIt.get<SystemService>();
}

ThemeService get themeService {
  return getIt.get<ThemeService>();
}

ToastService get toastService {
  return getIt.get<ToastService>();
}