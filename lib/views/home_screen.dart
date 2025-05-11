import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/views/favourite_news_tab.dart';
import 'package:assignment_bharatnxt/views/news_tab.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('News', style: Theme.of(context).textTheme.bodyLarge),
          bottom: TabBar(
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: [Tab(text: 'News'), Tab(text: 'Liked')],
            dividerColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: TabBarView(children: [NewsTab(), FavouriteNewsTab()]),
      ),
    );
  }
}

class CustomeContainer extends StatelessWidget {
  const CustomeContainer({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Stack(
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
              backgroundColor: Colors.grey[900],
              radius: 28,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: Colors.redAccent, size: 28),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
