import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/provider/article_provider.dart';
import 'package:assignment_bharatnxt/common/widget/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsTab extends ConsumerWidget {
  const NewsTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articleAsync = ref.watch(articleListProvider);
    final likedAsync = ref.watch(likedArticlesProvider);
    final query = ref.watch(searchQueryProvider);

    return RefreshIndicator(
      onRefresh: () async {
        return ref.refresh(apiServiceProvider);
      },
      child: Scaffold(
        body: articleAsync.when(
          data: (articles) {
            final lowerQuery = query.toLowerCase();
            final filteredArticles =
                query.isEmpty
                    ? articles
                    : articles.where((article) {
                      return (article.title ?? '').toLowerCase().contains(
                            lowerQuery,
                          ) ||
                          (article.description ?? '').toLowerCase().contains(
                            lowerQuery,
                          );
                    }).toList();
            return likedAsync.when(
              data: (likedIds) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[900],
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          hintText: 'Search',
                          hintStyle: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.all(10),
                        ),
                        onChanged: (value) {
                          ref.read(searchQueryProvider.notifier).state = value;
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: filteredArticles.length,
                        itemBuilder: (context, index) {
                          final article = filteredArticles[index];
                          final isLiked = likedIds.contains(article.uniqueId);
                          return CustomContainer(
                            article: article,
                            isLiked: isLiked,
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              error: (_, _) => Text("Error loading liked articles"),
              loading: () => Center(child: CircularProgressIndicator()),
            );
          },
          loading: () => Center(child: CircularProgressIndicator()),
          error:
              (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      error.toString(),
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () => ref.refresh(articleListProvider),
                      child: Text("Retry"),
                    ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
