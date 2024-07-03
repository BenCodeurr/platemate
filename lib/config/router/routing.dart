import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:platemate/presentation/screens/get_recipe.dart';
import 'package:platemate/presentation/screens/home_view.dart';

class Routing {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
          path: '/get_recipe',
          pageBuilder: (context, state) {
            return CustomTransitionPage(
                child: const GetRecipeView(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCirc)
                        .animate(animation),
                    child: child,
                  );
                });
          }),
    ],
  );
}
