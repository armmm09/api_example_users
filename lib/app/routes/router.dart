import 'package:api_example_users/app/data/models/users.dart';
import 'package:api_example_users/app/modules/login/loginScreen.dart';
import 'package:api_example_users/app/modules/users/userDetailScreen.dart';
import 'package:api_example_users/app/modules/users/usersScreen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lazyui/lazyui.dart';

import '../data/local/shared_preferences.dart';
import 'paths.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: Paths.login,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginScreen(), redirect: (context, _) async => _getRouteName(context)),
            
    GoRoute(
        path: Paths.user,
        builder: (BuildContext context, GoRouterState state) =>
            const UserScreen()),

    GoRoute(
        path: Paths.userDetails,
        builder: (BuildContext context, GoRouterState state) =>
            UserDetailScreen(user: state.extra as Users)),
  ],
);

String _getRouteName(BuildContext context) {
  String? token = prefs.getString('token');
  return token.hasNullOrEmpty ? Paths.login : Paths.user;
}