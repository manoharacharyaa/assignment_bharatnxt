import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'article.freezed.dart';
part 'article.g.dart';

@freezed
abstract class Article with _$Article {
  const factory Article({
    required Source? source,
    required String? author,
    required String? title,
    required String? description,
    required String? url,
    required String? urlToImage,
    required DateTime? publishedAt,
    required String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}

@freezed
abstract class Source with _$Source {
  const factory Source({required String? id, required String? name}) = _Source;

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

extension ArticleExtension on Article {
  String get uniqueId {
    final input =
        '${title ?? ''}|${author ?? ''}|${publishedAt?.toIso8601String() ?? ''}';
    return sha256.convert(utf8.encode(input)).toString();
  }
}
