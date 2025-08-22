import 'package:double_partners/config/router/transitions/page_transitions.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/domain/enum/log_level_enum.dart';
import 'package:double_partners/core/domain/enum/transition_type_enum.dart';
import 'package:double_partners/core/domain/models/user_model.dart';
import 'package:double_partners/core/ui/address/screens/address_creation_screen.dart';
import 'package:double_partners/core/ui/favorites/screens/favorites_screen.dart';
import 'package:double_partners/core/ui/splash/splash_screen.dart';
import 'package:double_partners/core/ui/users/screens/user_creation_screen.dart';
import 'package:double_partners/core/ui/users/screens/user_detail_screen.dart';
import 'package:double_partners/core/ui/users/screens/users_screen.dart';
import 'package:double_partners/share/widgets/route_not_found.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:double_partners/share/helpers/custom_console.dart';

part 'app_router.g.dart';

part 'routes.dart';

@riverpod
class Router extends _$Router {
  final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

  @override
  GoRouter build() {
    return GoRouter(navigatorKey: _rootNavigatorKey, initialLocation: SplashScreen.path, redirect: _redirect, routes: appRoutes);
  }

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    final path = state.uri.path;
    CustomConsole.log(message: 'Redirection triggered => path: ${state.path}, uri: ${state.uri}', level: LogLevel.info);

    if (!_isPathValid(path)) {
      CustomConsole.log(message: 'Ruta no válida: $path', level: LogLevel.warning);
      return RouteNotFound.path;
    }
    return null;
  }

  bool _isPathValid(String path) => appRoutes.any((route) => route.path == path);
}
