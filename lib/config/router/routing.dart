import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:platemate/features/camera/bloc/camera_bloc.dart';
import 'package:platemate/features/camera/presentation/pages/get_recipe_view.dart';
import 'package:platemate/presentation/view/home_view.dart';

class Routing {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      ShellRoute(
          builder: (context, state, child) {
            return BlocProvider(
              create: (context) => CameraBloc(),
              child: child,
            );
          },
          routes: [
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
          ])
    ],
  );
}
