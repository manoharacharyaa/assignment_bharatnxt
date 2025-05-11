import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  final String message;

  DioExceptions(this.message);

  factory DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
        return DioExceptions('Connection Timed Out Please try again');

      case DioExceptionType.badResponse:
        return DioExceptions(
          'Recieved invalid status: ${dioError.response?.statusCode}',
        );
      case DioExceptionType.unknown:
        return DioExceptions('No internet connection');
      default:
        return DioExceptions('Something went wrong');
    }
  }

  @override
  String toString() => message;
}
