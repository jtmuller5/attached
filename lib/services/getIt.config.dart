// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app/theme_service.dart' as _i9;
import 'app/toast_service.dart' as _i10;
import 'at/at_protocol_service.dart' as _i3;
import 'at/attached_service.dart' as _i4;
import 'at/note_service.dart' as _i7;
import 'at/persona_service.dart' as _i8;
import 'master/master_service.dart' as _i5;
import 'media/media_service.dart' as _i6;
import 'user/user_service.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AtProtocolService>(_i3.AtProtocolService());
  gh.singleton<_i4.AttachedService>(_i4.AttachedService());
  gh.singleton<_i5.MasterService>(_i5.MasterService());
  gh.factory<_i6.MediaService>(() => _i6.MediaService());
  gh.singleton<_i7.NoteService>(_i7.NoteService());
  gh.singleton<_i8.PersonaService>(_i8.PersonaService());
  gh.factory<_i9.ThemeService>(() => _i9.ThemeService());
  gh.factory<_i10.ToastService>(() => _i10.ToastService());
  gh.singleton<_i11.UserService>(_i11.UserService());
  return get;
}
