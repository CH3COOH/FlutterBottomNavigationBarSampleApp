import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tab_bar_sample_app/screen/splash/SplashScreen.dart';
import 'package:tab_bar_sample_app/screen/tab1_root/Tab1RootScreen.dart';

import '../screen/home/ScaffoldWithBottomNavBar.dart';
import '../screen/login/LoginScreen.dart';
import '../screen/settings/SettingsScreen.dart';
import '../screen/tab1_detail/Tab1DetailScreen.dart';
import '../screen/tab2_detail/Tab2DetailScreen.dart';
import '../screen/tab2_root/Tab2RootScreen.dart';
import '../screen/walk_through/WalkThroughScreen.dart';

//final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
      debugLogDiagnostics: true,
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/home/tab1',
      routes: [
        GoRoute(
          name: "splash",
          path: '/',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: SplashScreen(),
          ),
        ),
        GoRoute(
          name: "walkThrough",
          path: '/welcome/walkThrough',
          pageBuilder: (context, state) => const NoTransitionPage(
            child: WalkThroughScreen(),
          ),
        ),
        GoRoute(
          name: "login",
          path: '/welcome/login',
          pageBuilder: (context, state) => CustomTransitionPage(
            child: const LoginScreen(),
            transitionDuration: const Duration(milliseconds: 300),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
              opacity:
                  CurveTween(curve: Curves.easeInOutCirc).animate(animation),
              child: child,
            ),
          ),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: "tab1Detail",
          path: '/home/tab1/detail',
          builder: (context, state) => const Tab1DetailScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          name: "tab2Detail",
          path: '/home/tab2/detail',
          builder: (context, state) => const Tab2DetailScreen(),
        ),
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            pageBuilder: (context, state, child) {
              return CustomTransitionPage(
                child: ScaffoldWithBottomNavBar(child: child),
                transitionDuration: const Duration(milliseconds: 300),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: CurveTween(curve: Curves.easeInOutCirc)
                          .animate(animation),
                      child: child,
                    ),
              );
            },
            routes: [
              GoRoute(
                name: "tab1",
                path: '/home/tab1',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Tab1RootScreen(),
                ),
              ),
              GoRoute(
                name: "tab2",
                path: '/home/tab2',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: Tab2RootScreen(),
                ),
              ),
            ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/settings',
          name: 'settings',
          pageBuilder: (context, state) => const MaterialPage(
            fullscreenDialog: true,
            child: SettingsScreen(),
          ),
        ),
      ],
      redirect: (BuildContext context, GoRouterState state) async {

        print("GoRouterState: ${state.location}, ${state.subloc}");

        final prefs = await SharedPreferences.getInstance();
        final isLogin = prefs.getBool("isLogin") ?? false;
        if (!isLogin) {
          return '/welcome/login';
        }
        return null;
      }),
);
