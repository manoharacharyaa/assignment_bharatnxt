import 'package:assignment_bharatnxt/core/exceptions/dio_exceptions.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://saurav.tech/',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<List<dynamic>> fetchArticles() async {
    try {
      final response = await _dio.get('NewsAPI/everything/cnn.json');

      if (response.statusCode == 200) {
        return response.data['articles'];
      } else {
        throw DioExceptions('Failed to load articles: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    } catch (e) {
      throw DioExceptions('Unexpected error: $e');
    }
  }
}
