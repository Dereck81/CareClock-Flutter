import 'package:careclock/presentation/screens/home/home_screen.dart';
import 'package:careclock/presentation/screens/login/auth_selection_screen.dart';
import 'package:careclock/presentation/screens/login/email_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGoRouter {
	static final String authSelection = '/';
	static final String emailInput = '/email-input';
	static final String home = '/home';

	static CustomTransitionPage _fadeTransitionGoRouter(BuildContext context, GoRouterState state, Widget child) {
		return CustomTransitionPage<void>(
			key: state.pageKey,
			child: child,
			transitionDuration: const Duration(milliseconds: 300),
			transitionsBuilder: (context, animation, secondaryAnimation, child) {
				return FadeTransition(
					opacity: animation,
					child: child,
				);
			},
		);
	}

	static GoRouter appRouter() {
		return GoRouter(
			initialLocation: AppGoRouter.home,
			routes: <GoRoute>[
				GoRoute(
					path: AppGoRouter.authSelection,
					name: 'auth-selection',
					pageBuilder: (context, state) => _fadeTransitionGoRouter(context, state, const AuthSelectionScreen())
				),
				GoRoute(
					path: AppGoRouter.emailInput,
					name: 'email-input',
					pageBuilder: (context, state) => _fadeTransitionGoRouter(context, state, const EmailInputScreen())
				),
				GoRoute(
					path: AppGoRouter.home,
					name: 'home',
					pageBuilder: (context, state) => _fadeTransitionGoRouter(context, state, const HomeScreen())
				)
			]
		);
	}
}
