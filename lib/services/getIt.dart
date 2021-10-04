// ignore_for_file: file_names

import 'package:attached/services/getIt.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

// flutter packages pub run build_runner watch --delete-conflicting-outputs
// flutter packages pub run build_runner build --delete-conflicting-outputs
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
  generateForDir: [
    'lib/services/app',
    'lib/services/at',
    'lib/services/media',
    'lib/services/settings',
    'lib/services/theme',
    'lib/services/user',
    'lib/services/master',
  ],
)
void configureDependencies() => $initGetIt(getIt);