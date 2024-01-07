import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instawish/screens/HomePage.dart';
import 'package:instawish/screens/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Bug au niveau de shared_preferences isUserLoggedIn
Future<bool> isUserLoggedIn() async {
  final prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  return token != null && token.isNotEmpty;
}

final GoRouter router = GoRouter(
  redirect: (BuildContext context, GoRouterState state) async {
    // Vérifiez si l'utilisateur est connecté
    final loggedIn = true; //await isUserLoggedIn();

    // Si l'utilisateur essaie d'accéder à la HomePage sans être connecté
    final goingToHomePage = state.path == '/';
    print("goingToHomePage");
    print(state.path);
    if (!loggedIn && goingToHomePage) {
      // Redirigez vers LoginPage si l'utilisateur n'est pas connecté
      return '/login';
    }

    // Si l'utilisateur est connecté et essaie d'accéder à LoginPage
    final goingToLoginPage = state.path == '/login';
    if (loggedIn && goingToLoginPage) {
      // Redirigez vers HomePage si l'utilisateur est déjà connecté
      return '/';
    }

    // Aucune redirection nécessaire
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        }),
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
  ],
);
