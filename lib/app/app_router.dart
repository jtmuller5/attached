import 'package:attached/shared/check_atsign_guard.dart';
import 'package:attached/ui/atSignView/at_sign_view.dart';
import 'package:attached/ui/attachView/attach_view.dart';
import 'package:attached/ui/attachedProfileView/attached_profile_view.dart';
import 'package:attached/ui/homeView/home_view.dart';
import 'package:attached/ui/newNoteView/new_note_view.dart';
import 'package:attached/ui/noteCollectionView/note_collection_view.dart';
import 'package:attached/ui/noteDetailsView/note_details_view.dart';
import 'package:attached/ui/noteMedia/add_note_link.dart';
import 'package:attached/ui/profileView/profile_view.dart';
import 'package:attached/ui/signInView/sign_in_view.dart';
import 'package:auto_route/annotations.dart';

import 'app_router.gr.dart';

final appRouter = AppRouter(
    checkAtsignGuard: CheckAtsignGuard()
);

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: SignInView),
  AutoRoute(page: HomeView, guards: [CheckAtsignGuard],initial: true),
  AutoRoute(page: AtSignView),
  AutoRoute(page: NewNoteView),
  AutoRoute(page: AttachView),
  AutoRoute(page: ProfileView),
  AutoRoute(page: AddNoteLinkView),
  AutoRoute(page: AttachedProfileView),
  AutoRoute(page: NoteDetailsView),
  AutoRoute(page: NoteCollectionView)
])
class $AppRouter {}
