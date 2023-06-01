// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingModelResponse _$ListingModelResponseFromJson(
        Map<String, dynamic> json) =>
    ListingModelResponse(
      creatorId: json['creatorId'] as String,
      creatorName: json['creatorName'] as String,
      title: json['title'] as String,
      image: json['image'] as String,
      createdAt: json['createdAt'] as int,
      postId: json['id'] as String,
      duration: json['duration'] as int,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    )
      ..isActive = json['isActive'] as bool?
      ..descriptionText = json['descriptionText'] as String?;

Map<String, dynamic> _$ListingModelResponseToJson(
        ListingModelResponse instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'creatorName': instance.creatorName,
      'duration': instance.duration,
      'isActive': instance.isActive,
      'title': instance.title,
      'createdAt': instance.createdAt,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'image': instance.image,
      'descriptionText': instance.descriptionText,
      'id': instance.postId,
    };
