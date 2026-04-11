import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/pages/hadist/hadist_page.dart';
import 'package:hadist_pedia/presentation/pages/splash/splash_screen.dart';
import 'package:hadist_pedia/presentation/pages/home/home_pages.dart';
import 'package:hadist_pedia/presentation/pages/player/player_pages.dart';
import 'package:hadist_pedia/presentation/pages/book/book_page.dart';
import 'package:hadist_pedia/presentation/pages/book/stories_book.dart';

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
    GoRoute(
      path: '/hadist',
      builder: (context, state) {
        final Map<String, dynamic> extra = (state.extra as Map<String, dynamic>?) ?? {};
        final int index = extra['index'] as int? ?? 0;
        final String jsonPath = extra['jsonPath'] as String? ?? 'lib/json/hadist_bukhari.json';
        return HadistPage(index: index, jsonPath: jsonPath);
      },
    ),
    GoRoute(
      path: '/book',
      builder: (context, state) => const BookPage(),
    ),
    GoRoute(
      path: '/stories_book',
      builder: (context, state) => const StoriesBookPage(),
    ),
  ],
);