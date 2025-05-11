import 'package:assignment_bharatnxt/provider/article_provider.dart';
import 'package:assignment_bharatnxt/common/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouriteNewsTab extends ConsumerWidget {
  const FavouriteNewsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteArticlesProvider);

    return Scaffold(
      body: favoritesAsync.when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text("Error: $err")),
        data: (favorites) {
          if (favorites.isEmpty) {
            return Center(child: Text("No favorites yet"));
          }
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final article = favorites[index];
              return CustomContainer(article: article, isLiked: true);
            },
          );
        },
      ),
    );
  }
}
