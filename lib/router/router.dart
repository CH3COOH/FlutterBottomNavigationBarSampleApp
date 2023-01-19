import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tab_bar_sample_app/screen/splash/SplashScreen.dart';
import 'package:tab_bar_sample_app/screen/tab1_root/Tab1RootScreen.dart';

import '../screen/login/LoginScreen.dart';
import '../screen/tab1_detail/Tab1DetailScreen.dart';
import '../screen/walk_through/WalkThroughScreen.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider(
  (ref) => GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
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
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          ),
        ),
      ),
      GoRoute(
        name: "tab1",
        path: '/home/tab1',
        builder: (context, state) => const Tab1RootScreen(),
      ),
      GoRoute(
        name: "tab1Detail",
        path: '/home/tab1/detail',
        builder: (context, state) => const Tab1DetailScreen(),
      ),
    ],
  ),
);
