import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/repositories/article_repositiries.dart';
import 'package:assignment_bharatnxt/core/services/api_services.dart';
import 'package:assignment_bharatnxt/core/utils/favourites_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider((ref) => ApiServices());

final articleRepositoryProvider = Provider(
  (ref) => ArticleRepositiries(ref.read(apiServiceProvider)),
);

final articleListProvider = FutureProvider<List<Article>>(
  (ref) => ref.read(articleRepositoryProvider).getArticles(),
);

final likedArticlesProvider = FutureProvider<Set<String>>((ref) async {
  return await FavouritesManager.getLikedIds();
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final favoriteArticlesProvider = Provider<AsyncValue<List<Article>>>((ref) {
  final articlesAsync = ref.watch(articleListProvider);
  final likedIdsAsync = ref.watch(likedArticlesProvider);

  if (articlesAsync is AsyncLoading || likedIdsAsync is AsyncLoading) {
    return const AsyncLoading();
  } else if (articlesAsync is AsyncError) {
    return AsyncError(articlesAsync.error!, articlesAsync.stackTrace!);
  } else if (likedIdsAsync is AsyncError) {
    return AsyncError(likedIdsAsync.error!, likedIdsAsync.stackTrace!);
  } else {
    final articles = articlesAsync.value!;
    final likedIds = likedIdsAsync.value!;
    final favorites =
        articles.where((a) => likedIds.contains(a.uniqueId)).toList();
    return AsyncData(favorites);
  }
});
