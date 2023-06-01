// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsDetailResponse _$ListingsDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ListingsDetailResponse(
      listings: (json['posts'] as List<dynamic>)
          .map((e) => ListingModelResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      maxElementsNum: json['maxElementsNum'] as int,
    );

Map<String, dynamic> _$ListingsDetailResponseToJson(
        ListingsDetailResponse instance) =>
    <String, dynamic>{
      'posts': instance.listings,
      'maxElementsNum': instance.maxElementsNum,
    };
