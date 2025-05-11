import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/common/widget/custom_tile.dart';
import 'package:assignment_bharatnxt/common/widget/pop_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: Image.network(article.urlToImage!),
                ),
                PopButton(),
              ],
            ),
            CustomTile(label: 'Title', text: article.title ?? ''),
            CustomTile(label: 'Description', text: article.description ?? ''),
            CustomTile(label: 'Content', text: article.content ?? ''),
            CustomTile(label: 'Author', text: article.author ?? ''),
            CustomTile(
              label: 'Published At',
              text: DateFormat('dd/MM/yy').format(article.publishedAt!),
            ),
            CustomTile(
              label: 'Learn More',
              maxLines: 1,
              textColor: Colors.blueAccent,
              text: article.url ?? '',
            ).onTap(
              context,
              () => context.push('/webview', extra: {'url': article.url}),
            ),
          ],
        ),
      ),
    );
  }
}
