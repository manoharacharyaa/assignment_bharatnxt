import 'package:assignment_bharatnxt/core/exceptions/dio_exceptions.dart';
import 'package:assignment_bharatnxt/model/article.dart';
import 'package:assignment_bharatnxt/core/services/api_services.dart';

class ArticleRepositiries {
  ApiServices apiServices;
  ArticleRepositiries(this.apiServices);

  Future<List<Article>> getArticles() async {
    try {
      final response = await apiServices.fetchArticles();
      return response
          .map<Article>((article) => Article.fromJson(article))
          .toList();
    } catch (e) {
      if (e is DioExceptions) {
        rethrow;
      } else {
        throw DioExceptions('Failed to process articles: $e');
      }
    }
  }
}
