import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../../features/auth/pages/login_page.dart';
import '../../features/auth/pages/signup_page.dart';
import '../../features/auth/pages/forgot_password_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/onboarding/pages/onboarding_page.dart';
import '../../features/food/pages/food_details_page.dart';
import '../../features/order/pages/checkout_page.dart';
import '../../features/order/pages/order_success_page.dart';
import '../../features/order/pages/orders_page.dart';
import '../../features/profile/pages/profile_page.dart';
import '../../shared/models/food_item.dart';

class AppRouter {
  final AuthProvider authProvider;

  AppRouter(this.authProvider);

  late final GoRouter router = GoRouter(
    initialLocation: '/',
    refreshListenable: authProvider,
    redirect: (context, state) {
      final isAuthenticated = authProvider.isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/login' || 
                          state.matchedLocation == '/signup' || 
                          state.matchedLocation == '/onboarding' ||
                          state.matchedLocation == '/';

      if (!isAuthenticated && !isLoggingIn) {
        return '/login';
      }
      
      if (isAuthenticated && isLoggingIn) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignupPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/dashboard',
        name: 'dashboard',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/food-details',
        name: 'food-details',
        builder: (context, state) {
          final item = state.extra as FoodItem;
          return FoodDetailsPage(item: item);
        },
      ),
      GoRoute(
        path: '/checkout',
        name: 'checkout',
        builder: (context, state) => const CheckoutPage(),
      ),
      GoRoute(
        path: '/order-success',
        name: 'order-success',
        builder: (context, state) => const OrderSuccessPage(),
      ),
      GoRoute(
        path: '/orders',
        name: 'orders',
        builder: (context, state) => const OrdersPage(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfilePage(),
      ),
    ],
  );
}
