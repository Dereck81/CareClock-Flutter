import 'package:careclock/presentation/screens/add-reminder/medication/medication_confirm_screen.dart';
import 'package:careclock/presentation/screens/add-reminder/medication/medication_frequency_screen.dart';
import 'package:careclock/presentation/screens/add-reminder/medication/medication_search_screen.dart';
import 'package:careclock/presentation/screens/add-reminder/medication/medication_success_screen.dart';
import 'package:careclock/presentation/screens/add-reminder/medication/medication_time_screen.dart';
import 'package:careclock/presentation/screens/home/home_screen.dart';
import 'package:careclock/presentation/screens/login/auth_selection_screen.dart';
import 'package:careclock/presentation/screens/login/email_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppGoRouter {
  static final String authSelection = '/';
  static final String emailInput = '/email-input';
  static final String home = '/home';
  static final String medicationSearch = '/add-reminder/medication-search';
  static final String medicationFrequency =
      '/add-reminder/medication-frequency';
  static final String medicationTime = '/add-reminder/medication-time';
  static final String medicationConfirm = '/add-reminder/medication-confirm';
  static final String medicationSuccess = '/add-reminder/medication-success';

  static CustomTransitionPage _fadeTransitionGoRouter(
    BuildContext context,
    GoRouterState state,
    Widget child,
  ) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
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
          pageBuilder: (context, state) => _fadeTransitionGoRouter(
            context,
            state,
            const AuthSelectionScreen(),
          ),
        ),
        GoRoute(
          path: AppGoRouter.emailInput,
          name: 'email-input',
          pageBuilder: (context, state) =>
              _fadeTransitionGoRouter(context, state, const EmailInputScreen()),
        ),
        GoRoute(
          path: AppGoRouter.home,
          name: 'home',
          pageBuilder: (context, state) =>
              _fadeTransitionGoRouter(context, state, const HomeScreen()),
        ),
        GoRoute(
          path: AppGoRouter.medicationSearch,
          name: 'medication-search',
          pageBuilder: (context, state) => _fadeTransitionGoRouter(
            context,
            state,
            const MedicationSearchScreen(),
          ),
        ),
        GoRoute(
          path: AppGoRouter.medicationFrequency,
          name: 'medication-frequency',
          pageBuilder: (context, state) => _fadeTransitionGoRouter(
            context,
            state,
            const MedicationFrequencyScreen(),
          ),
        ),
        GoRoute(
          path: AppGoRouter.medicationTime,
          name: 'medication-time',
          pageBuilder: (context, state) => _fadeTransitionGoRouter(
            context,
            state,
            const MedicationTimeScreen(),
          ),
        ),
        GoRoute(
          path: AppGoRouter.medicationConfirm,
          name: 'medication-confirm',
          pageBuilder: (context, state) => _fadeTransitionGoRouter(
            context,
            state,
            const MedicationConfirmScreen(),
          ),
        ),
        GoRoute(
          path: AppGoRouter.medicationSuccess,
          name: 'medication-success',
          pageBuilder: (context, state) => _fadeTransitionGoRouter(
            context,
            state,
            const MedicationSuccessScreen(),
          ),
        ),
      ],
    );
  }
}
