part of 'app_router.dart';

final appRoutes = [
  // ? Add your routes here
  GoRoute(
    name: SplashScreen.screenName,
    path: SplashScreen.path,
    pageBuilder:
        (context, state) => PageTransitions(screen: SplashScreen(), transitionType: TransitionType.scale, durationTransition: k500milSec),
  ),
  GoRoute(
    name: RouteNotFound.screenName,
    path: RouteNotFound.path,
    pageBuilder:
        (context, state) => PageTransitions(screen: RouteNotFound(), transitionType: TransitionType.fade, durationTransition: k500milSec),
  ),
  GoRoute(
    name: UsersScreen.screenName,
    path: UsersScreen.path,
    pageBuilder:
        (context, state) =>
            PageTransitions(screen: const UsersScreen(), transitionType: TransitionType.fade, durationTransition: k500milSec),
  ),
  GoRoute(
    name: FavoritesScreen.screenName,
    path: FavoritesScreen.path,
    pageBuilder:
        (context, state) =>
            PageTransitions(screen: const FavoritesScreen(), transitionType: TransitionType.fade, durationTransition: k500milSec),
  ),
  GoRoute(
    name: UserCreationScreen.screenName,
    path: UserCreationScreen.path,
    pageBuilder:
        (context, state) =>
            PageTransitions(screen: const UserCreationScreen(), transitionType: TransitionType.size, durationTransition: k500milSec),
  ),
  GoRoute(
    name: UserDetailScreen.screenName,
    path: UserDetailScreen.path,
    pageBuilder:
        (context, state) {
          final user = state.extra as UserModel?;
          return PageTransitions(screen: UserDetailScreen(user: user,), transitionType: TransitionType.slide, durationTransition: k500milSec);
        },
  ),
  GoRoute(
    name: AddressCreationScreen.screenName,
    path: AddressCreationScreen.path,
    pageBuilder:
        (context, state) =>
            PageTransitions(screen: const AddressCreationScreen(), transitionType: TransitionType.size, durationTransition: k500milSec),
  ),
];
