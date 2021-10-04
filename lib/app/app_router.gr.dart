// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:attached/shared/check_atsign_guard.dart' as _i13;
import 'package:attached/ui/atSignView/at_sign_view.dart' as _i3;
import 'package:attached/ui/attachedProfileView/attached_profile_view.dart'
    as _i8;
import 'package:attached/ui/attachView/attach_view.dart' as _i5;
import 'package:attached/ui/homeView/home_view.dart' as _i2;
import 'package:attached/ui/newNoteView/new_note_view.dart' as _i4;
import 'package:attached/ui/noteCollectionView/note_collection_view.dart'
    as _i10;
import 'package:attached/ui/noteDetailsView/note_details_view.dart' as _i9;
import 'package:attached/ui/noteMedia/add_note_link.dart' as _i7;
import 'package:attached/ui/profileView/profile_view.dart' as _i6;
import 'package:attached/ui/signInView/sign_in_view.dart' as _i1;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

class AppRouter extends _i11.RootStackRouter {
  AppRouter(
      {_i12.GlobalKey<_i12.NavigatorState>? navigatorKey,
      required this.checkAtsignGuard})
      : super(navigatorKey);

  final _i13.CheckAtsignGuard checkAtsignGuard;

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SignInViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i1.SignInView());
    },
    HomeViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.HomeView());
    },
    AtSignViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.AtSignView());
    },
    NewNoteViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.NewNoteView());
    },
    AttachViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.AttachView());
    },
    ProfileViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.ProfileView());
    },
    AddNoteLinkViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.AddNoteLinkView());
    },
    AttachedProfileViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.AttachedProfileView());
    },
    NoteDetailsViewRoute.name: (routeData) {
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData, child: _i9.NoteDetailsView());
    },
    NoteCollectionViewRoute.name: (routeData) {
      final args = routeData.argsAs<NoteCollectionViewRouteArgs>();
      return _i11.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i10.NoteCollectionView(key: args.key, type: args.type));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SignInViewRoute.name, path: '/sign-in-view'),
        _i11.RouteConfig(HomeViewRoute.name,
            path: '/', guards: [checkAtsignGuard]),
        _i11.RouteConfig(AtSignViewRoute.name, path: '/at-sign-view'),
        _i11.RouteConfig(NewNoteViewRoute.name, path: '/new-note-view'),
        _i11.RouteConfig(AttachViewRoute.name, path: '/attach-view'),
        _i11.RouteConfig(ProfileViewRoute.name, path: '/profile-view'),
        _i11.RouteConfig(AddNoteLinkViewRoute.name,
            path: '/add-note-link-view'),
        _i11.RouteConfig(AttachedProfileViewRoute.name,
            path: '/attached-profile-view'),
        _i11.RouteConfig(NoteDetailsViewRoute.name, path: '/note-details-view'),
        _i11.RouteConfig(NoteCollectionViewRoute.name,
            path: '/note-collection-view')
      ];
}

/// generated route for [_i1.SignInView]
class SignInViewRoute extends _i11.PageRouteInfo<void> {
  const SignInViewRoute() : super(name, path: '/sign-in-view');

  static const String name = 'SignInViewRoute';
}

/// generated route for [_i2.HomeView]
class HomeViewRoute extends _i11.PageRouteInfo<void> {
  const HomeViewRoute() : super(name, path: '/');

  static const String name = 'HomeViewRoute';
}

/// generated route for [_i3.AtSignView]
class AtSignViewRoute extends _i11.PageRouteInfo<void> {
  const AtSignViewRoute() : super(name, path: '/at-sign-view');

  static const String name = 'AtSignViewRoute';
}

/// generated route for [_i4.NewNoteView]
class NewNoteViewRoute extends _i11.PageRouteInfo<void> {
  const NewNoteViewRoute() : super(name, path: '/new-note-view');

  static const String name = 'NewNoteViewRoute';
}

/// generated route for [_i5.AttachView]
class AttachViewRoute extends _i11.PageRouteInfo<void> {
  const AttachViewRoute() : super(name, path: '/attach-view');

  static const String name = 'AttachViewRoute';
}

/// generated route for [_i6.ProfileView]
class ProfileViewRoute extends _i11.PageRouteInfo<void> {
  const ProfileViewRoute() : super(name, path: '/profile-view');

  static const String name = 'ProfileViewRoute';
}

/// generated route for [_i7.AddNoteLinkView]
class AddNoteLinkViewRoute extends _i11.PageRouteInfo<void> {
  const AddNoteLinkViewRoute() : super(name, path: '/add-note-link-view');

  static const String name = 'AddNoteLinkViewRoute';
}

/// generated route for [_i8.AttachedProfileView]
class AttachedProfileViewRoute extends _i11.PageRouteInfo<void> {
  const AttachedProfileViewRoute()
      : super(name, path: '/attached-profile-view');

  static const String name = 'AttachedProfileViewRoute';
}

/// generated route for [_i9.NoteDetailsView]
class NoteDetailsViewRoute extends _i11.PageRouteInfo<void> {
  const NoteDetailsViewRoute() : super(name, path: '/note-details-view');

  static const String name = 'NoteDetailsViewRoute';
}

/// generated route for [_i10.NoteCollectionView]
class NoteCollectionViewRoute
    extends _i11.PageRouteInfo<NoteCollectionViewRouteArgs> {
  NoteCollectionViewRoute({_i12.Key? key, required String type})
      : super(name,
            path: '/note-collection-view',
            args: NoteCollectionViewRouteArgs(key: key, type: type));

  static const String name = 'NoteCollectionViewRoute';
}

class NoteCollectionViewRouteArgs {
  const NoteCollectionViewRouteArgs({this.key, required this.type});

  final _i12.Key? key;

  final String type;
}
