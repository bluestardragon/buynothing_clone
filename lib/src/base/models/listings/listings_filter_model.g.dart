// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_filter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsFilterModel _$ListingsFilterModelFromJson(Map<String, dynamic> json) =>
    ListingsFilterModel(
      pageNumber: json['pageNumber'] as int?,
      totalPerPage: json['totalPerPage'] as int?,
    )..keyword = json['keyword'] as String?;

Map<String, dynamic> _$ListingsFilterModelToJson(
        ListingsFilterModel instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'totalPerPage': instance.totalPerPage,
      'keyword': instance.keyword,
    };
