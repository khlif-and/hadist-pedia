import 'package:go_router/go_router.dart';
import 'package:hadist_pedia/presentation/pages/hadist/hadist_page.dart';
import 'package:hadist_pedia/presentation/pages/splash/splash_screen.dart';
import 'package:hadist_pedia/presentation/pages/home/home_pages.dart';
import 'package:hadist_pedia/presentation/pages/player/player_pages.dart';
import 'package:hadist_pedia/presentation/pages/book/book_page.dart';
import 'package:hadist_pedia/presentation/pages/book/stories_book.dart';
import 'package:hadist_pedia/presentation/pages/search/search_page.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) =>
          NoTransitionPage(key: state.pageKey, child: const SplashScreen()),
    ),
    GoRoute(
      path: '/home',
      pageBuilder: (context, state) =>
          NoTransitionPage(key: state.pageKey, child: const HomePages()),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) =>
          NoTransitionPage(key: state.pageKey, child: const SearchPage()),
    ),
    GoRoute(
      path: '/player',
      pageBuilder: (context, state) =>
          NoTransitionPage(key: state.pageKey, child: const PlayerPages()),
    ),
    GoRoute(
      path: '/hadist',
      pageBuilder: (context, state) {
        final Map<String, dynamic> extra =
            (state.extra as Map<String, dynamic>?) ?? {};
        final int index = extra['index'] as int? ?? 0;
        final String jsonPath =
            extra['jsonPath'] as String? ?? 'lib/json/hadist_bukhari.json';
        return NoTransitionPage(
          key: state.pageKey,
          child: HadistPage(index: index, jsonPath: jsonPath),
        );
      },
    ),
    GoRoute(
      path: '/book',
      pageBuilder: (context, state) {
        final Map<String, dynamic> extra =
            (state.extra as Map<String, dynamic>?) ?? {};
        final int index = extra['index'] as int? ?? 0;
        final String jsonPath =
            extra['jsonPath'] as String? ?? 'lib/json/story_tabiin.json';
        return NoTransitionPage(
          key: state.pageKey,
          child: BookPage(index: index, jsonPath: jsonPath),
        );
      },
    ),
    GoRoute(
      path: '/stories_book',
      pageBuilder: (context, state) {
        final Map<String, dynamic> extra =
            (state.extra as Map<String, dynamic>?) ?? {};
        final int index = extra['index'] as int? ?? 0;
        final String jsonPath =
            extra['jsonPath'] as String? ?? 'lib/json/story_tabiin.json';
        return NoTransitionPage(
          key: state.pageKey,
          child: StoriesBookPage(index: index, jsonPath: jsonPath),
        );
      },
    ),
  ],
);
