import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/pages/splash/splash_screen.dart';
import 'package:hadist_pedia/presentation/pages/home/home_pages.dart';
import 'package:hadist_pedia/presentation/pages/player/player_pages.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePages(),
    ),
    GoRoute(
      path: '/player',
      builder: (context, state) => const PlayerPages(),
    ),
  ],
);