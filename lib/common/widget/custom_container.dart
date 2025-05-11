import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/provider/article_provider.dart';
import 'package:assignment_bharatnxt/core/utils/favourites_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomContainer extends ConsumerWidget {
  const CustomContainer({
    super.key,
    required this.article,
    required this.isLiked,
  });

  final Article article;
  final bool isLiked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => context.push('/details', extra: {'article': article}),
      child: Stack(
        children: [
          Container(
            height: 250,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                article.urlToImage!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.deepPurpleAccent,
                  );
                },
              ),
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: List.generate(
                  20,
                  (i) => Color.fromARGB(10 + (i * 12), 0, 0, 0),
                ),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            height: 250,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                article.title!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(166, 33, 33, 33),
                radius: 28,
                child: IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    await FavouritesManager.toggleLikes(article.uniqueId);
                    ref.invalidate(likedArticlesProvider);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
