import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/providers/auth_provider.dart';
import 'core/routing/app_router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const DashDishApp(),
    ),
  );
}

class DashDishApp extends StatefulWidget {
  const DashDishApp({super.key});

  @override
  State<DashDishApp> createState() => _DashDishAppState();
}

class _DashDishAppState extends State<DashDishApp> {
  late AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _appRouter = AppRouter(context.read<AuthProvider>());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'DashDish',
      routerConfig: _appRouter.router,
    );
  }
}
