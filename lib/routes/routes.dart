import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/views/article_details_screen.dart';
import 'package:assignment_bharatnxt/views/home_screen.dart';
import 'package:assignment_bharatnxt/views/webview_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  GoRouter get routes => _routes;

  final GoRouter _routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => HomeScreen()),
      GoRoute(
        path: '/details',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final article = args['article'] as Article;
          return ArticleDetailsScreen(article: article);
        },
      ),
      GoRoute(
        path: '/webview',
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final url = args['url'] as String;
          return WebViewScreen(url: url);
        },
      ),
    ],
  );
}
