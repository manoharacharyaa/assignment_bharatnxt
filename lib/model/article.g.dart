// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Article _$ArticleFromJson(Map<String, dynamic> json) => _Article(
  source:
      json['source'] == null
          ? null
          : Source.fromJson(json['source'] as Map<String, dynamic>),
  author: json['author'] as String?,
  title: json['title'] as String?,
  description: json['description'] as String?,
  url: json['url'] as String?,
  urlToImage: json['urlToImage'] as String?,
  publishedAt:
      json['publishedAt'] == null
          ? null
          : DateTime.parse(json['publishedAt'] as String),
  content: json['content'] as String?,
);

Map<String, dynamic> _$ArticleToJson(_Article instance) => <String, dynamic>{
  'source': instance.source,
  'author': instance.author,
  'title': instance.title,
  'description': instance.description,
  'url': instance.url,
  'urlToImage': instance.urlToImage,
  'publishedAt': instance.publishedAt?.toIso8601String(),
  'content': instance.content,
};

_Source _$SourceFromJson(Map<String, dynamic> json) =>
    _Source(id: json['id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$SourceToJson(_Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
