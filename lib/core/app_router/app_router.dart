import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../entities/user_yorsho/user_yorsho_entity.dart';
import '../../entities/videos/videos_entity.dart';
import '../../features/app/presentation/bloc/app_bloc.dart';
import '../../features/app_director/presentation/pages/app_director_page.dart';
import '../../features/favorites/presentation/pages/favorites_page.dart';
import '../../features/home/presentation/pages/home/home_page.dart';
import '../../features/home/presentation/pages/home_agreements/home_agreements_page.dart';
import '../../features/home/presentation/pages/home_birth_date/home_birth_date_page.dart';
import '../../features/home/presentation/pages/home_gender/home_gender_page.dart';
import '../../features/home/presentation/pages/home_name_surname/home_name_surname_page.dart';
import '../../features/home/presentation/pages/home_profile_photo/home_profile_photo_page.dart';
import '../../features/home_child/presentation/pages/home_child_page.dart';
import '../../features/login/presentation/pages/login_page.dart';
import '../../features/market/presentation/pages/market_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/reset_password/presentation/pages/reset_password_page.dart';
import '../../features/sign_up/presentation/pages/sign_up_page.dart';
import '../../features/stars/presentation/pages/stars_page.dart';
import '../../features/video_player/presentation/pages/video_player_page.dart';
import '../../features/videos/presentation/pages/videos_page.dart';
import '../../injector/injector.dart';
import '../../widgets/custom_buttom_navigation/custom_bottom_navigation.dart';
import '../../widgets/pages/error_page.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String loginName = 'login';
  static const String loginPath = '/login';

  static const String resetPasswordName = 'resetPassword';
  static const String resetPasswordPath = 'resetPassword';

  static const String signUpName = 'signUp';
  static const String signUpPath = 'signUp';

  static const String homeName = 'home';
  static const String homePath = '/home';

  static const String homeChildName = 'homeChild';
  static const String homeChildPath = '/homeChild';

  static const String homeNameSurnameName = 'homeNameSurname';
  static const String homeNameSurnamePath = '/homeNameSurname';

  static const String homeBirthDateName = 'homeBirthDate';
  static const String homeBirthDatePath = 'homeBirthDate';

  static const String homeGenderName = 'homeGender';
  static const String homeGenderPath = 'homeGender';

  static const String homeProfilePhotoName = 'homeProfilePhoto';
  static const String homeProfilePhotoPath = 'homeProfilePhoto';

  static const String homeAgreementsName = 'homeAgreements';
  static const String homeAgreementsPath = 'homeAgreements';

  static const String marketName = 'market';
  static const String marketPath = '/market';

  static const String favoritesName = 'favorites';
  static const String favoritesPath = '/favorites';

  static const String starsName = 'stars';
  static const String starsPath = '/stars';

  static const String rackItemPhotoName = 'rackItemPhoto';
  static const String rackItemPhotoPath = '/rackItemPhoto';

  static const String videosName = 'videos';
  static const String videosPath = '/videos';

  static const String videoPlayerName = 'videoPlayer';
  static const String videoPlayerPath = 'videoPlayer';

  static const String notificationName = 'notification';
  static const String notificationPath = '/notification';

  static const String profileName = 'profile';
  static const String profilePath = '/profile';

  static const String profileSettingsNameSurnameName =
      'profileSettingsNameSurname';
  static const String profileSettingsNameSurnamePath =
      '/profileSettingsNameSurname';

  static const String profileSettingsBirthDateName = 'profileSettingsBirthDate';
  static const String profileSettingsBirthDatePath =
      '/profileSettingsBirthDate';

  static const String profileSettingsGenderName = 'profileSettingsGender';
  static const String profileSettingsGenderPath = '/profileSettingsGender';

  static const String profileSettingsProfilePhotoName =
      'profileSettingsProfilePhoto';
  static const String profileSettingsProfilePhotoPath =
      '/profileSettingsProfilePhoto';

  static GoRouter get router => _router;

  static final GlobalKey<NavigatorState> _parentNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _homeTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _favoriteTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _starsTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _marketTabNavigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<NavigatorState> _profileTabNavigatorKey =
      GlobalKey<NavigatorState>();

  BuildContext get context =>
      router.routerDelegate.navigatorKey.currentContext!;

  GoRouterDelegate get routerDelegate => router.routerDelegate;

  GoRouteInformationParser get routeInformationParser =>
      router.routeInformationParser;

  static final _routes = [
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: _parentNavigatorKey,
      branches: [
        StatefulShellBranch(
          navigatorKey: _homeTabNavigatorKey,
          routes: [
            GoRoute(
              path: homePath,
              name: homeName,
              pageBuilder: (context, GoRouterState state) {
                return MaterialPage(
                  child: const HomePage(),
                  key: state.pageKey,
                );
              },
              routes: [
                GoRoute(
                  name: homeChildName,
                  path: homeChildPath,
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition<void>(
                        context: context,
                        state: state,
                        child: const HomeChildPage(),
                      ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _favoriteTabNavigatorKey,
          routes: [
            GoRoute(
              path: favoritesPath,
              name: favoritesName,
              pageBuilder: (context, state) {
                return MaterialPage(child: FavoritesPage(key: state.pageKey));
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _starsTabNavigatorKey,
          routes: [
            GoRoute(
              path: starsPath,
              name: starsName,
              pageBuilder: (context, GoRouterState state) {
                return MaterialPage(
                  child: const StarsPage(),
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _marketTabNavigatorKey,
          routes: [
            GoRoute(
              path: marketPath,
              name: marketName,
              pageBuilder: (context, GoRouterState state) {
                return MaterialPage(
                  child: const MarketPage(),
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _profileTabNavigatorKey,
          routes: [
            GoRoute(
              path: profilePath,
              name: profileName,
              pageBuilder: (context, GoRouterState state) {
                return MaterialPage(
                  child: const ProfilePage(),
                  key: state.pageKey,
                );
              },
            ),
          ],
        ),
      ],
      pageBuilder:
          (
            BuildContext context,
            GoRouterState state,
            StatefulNavigationShell navigationShell,
          ) {
            return MaterialPage(
              child: CustomBottomNavigation(child: navigationShell),
              key: state.pageKey,
            );
          },
    ),
    GoRoute(
      name: videosName,
      path: videosPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: VideosPage(
          videosEntity: state.extra == null
              ? null
              : state.extra as VideosEntity?,
        ),
      ),
      routes: [
        GoRoute(
          name: videoPlayerName,
          path: videoPlayerPath,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: VideoPlayerPage(
              videosEntity: state.extra == null ? null : state.extra as VideosEntity?,
            ),
          ),
        ),
      ],
    ),

    GoRoute(
      name: appDirector,
      path: appDirectorPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: const AppDirectorPage(),
      ),
    ),
    GoRoute(
      name: loginName,
      path: loginPath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: LoginPage(
          userCredentials: state.extra == null ? null : state.extra as Map?,
        ),
      ),
      routes: [
        GoRoute(
          name: resetPasswordName,
          path: resetPasswordPath,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const ResetPasswordPage(),
          ),
        ),
        GoRoute(
          name: signUpName,
          path: signUpPath,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: const SignUpPage(),
          ),
        ),
      ],
    ),
    GoRoute(
      name: homeNameSurnameName,
      path: homeNameSurnamePath,
      pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
        context: context,
        state: state,
        child: HomeNameSurnamePage(
          userYorshoEntity: state.extra as UserYorshoEntity,
        ),
      ),
      routes: [
        GoRoute(
          name: homeBirthDateName,
          path: homeBirthDatePath,
          pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
            context: context,
            state: state,
            child: HomeBirthDatePage(
              userYorshoEntity: state.extra as UserYorshoEntity,
            ),
          ),
          routes: [
            GoRoute(
              name: homeGenderName,
              path: homeGenderPath,
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                    context: context,
                    state: state,
                    child: HomeGenderPage(
                      userYorshoEntity: state.extra as UserYorshoEntity,
                    ),
                  ),
              routes: [
                GoRoute(
                  name: homeProfilePhotoName,
                  path: homeProfilePhotoPath,
                  pageBuilder: (context, state) =>
                      buildPageWithDefaultTransition<void>(
                        context: context,
                        state: state,
                        child: HomeProfilePhotoPage(
                          userYorshoEntity: state.extra as UserYorshoEntity,
                        ),
                      ),
                  routes: [
                    GoRoute(
                      name: homeAgreementsName,
                      path: homeAgreementsPath,
                      pageBuilder: (context, state) =>
                          buildPageWithDefaultTransition<void>(
                            context: context,
                            state: state,
                            child: HomeAgreementsPage(
                              userYorshoEntity: state.extra as UserYorshoEntity,
                            ),
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];

  static final _router = GoRouter(
    navigatorKey: _parentNavigatorKey,
    initialLocation: appDirectorPath,
    routes: _routes,
    refreshListenable: GoRouterRefreshBloc(Injector.instance<AppBloc>()),
    redirect: (BuildContext context, GoRouterState state) {
      final bool isLoggedIn =
          context.read<AppBloc>().state.authenticationStatus ==
          AuthenticationStatus.authenticated;

      final bool isLoggingIn = state.matchedLocation == AppRouter.loginPath;

      // resetPasswordPath
      if (!isLoggedIn &&
          state.matchedLocation ==
              '${AppRouter.loginPath}/${AppRouter.resetPasswordPath}') {
        return null;
      }

      // signUpPath
      if (!isLoggedIn &&
          state.matchedLocation ==
              '${AppRouter.loginPath}/${AppRouter.signUpPath}') {
        return null;
      }
      if (!isLoggedIn) {
        return isLoggingIn ? null : AppRouter.loginPath;
      }

      return null;
    },
    errorBuilder: (context, state) =>
        const ErrorPage(content: 'Page not found 404'),
  );
}

class GoRouterRefreshBloc<BLOC extends BlocBase<STATE>, STATE>
    extends ChangeNotifier {
  GoRouterRefreshBloc(BLOC bloc) {
    _blocStream = bloc.stream.listen((STATE _) => notifyListeners());
  }

  late final StreamSubscription<STATE> _blocStream;

  @override
  void dispose() {
    _blocStream.cancel();
    super.dispose();
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  var begin = const Offset(1.0, 0.0);
  var end = Offset.zero;
  var curve = Curves.ease;
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(position: animation.drive(tween), child: child),
  );
}
