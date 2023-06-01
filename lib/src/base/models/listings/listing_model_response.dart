import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listing_model_response.g.dart';

@JsonSerializable()
class ListingModelResponse {
  String creatorId;
  String creatorName;
  int duration;
  bool? isActive;
  String title;
  int createdAt;
  double latitude;
  double longitude;
  String image;
  String? descriptionText;
  @JsonKey(name: 'id')
  String postId;

  ListingModelResponse({
    required this.creatorId,
    required this.creatorName,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.postId,
    required this.duration,
    required this.latitude,
    required this.longitude
  });

  factory ListingModelResponse.fromJson(Map<String, dynamic> json) => _$ListingModelResponseFromJson(json);

  factory ListingModelResponse.fromSnapshot(DataSnapshot snapshot){
    Map<String, dynamic> map = json.decode(json.encode(snapshot.value));
    ListingModelResponse listing =  ListingModelResponse(
        postId: snapshot!.key.toString(),
        creatorId: map["creatorId"],
        creatorName: map["creatorName"],
        title: map["title"],
        image: map["image"],
        createdAt: map["createdAt"],
        duration: map["duration"],
        latitude: map["latitude"],
        longitude: map["longitude"]);
    listing.descriptionText = map["descriptionText"]??"";
    return listing;
  }

  Map<String, dynamic> toJson() => _$ListingModelResponseToJson(this);

  Map<String, dynamic> toJsonForSnapshot() =><String, dynamic>{
    'creatorId': this.creatorId,
    'creatorName': this.creatorName,
    'duration': this.duration,
    'isActive': this.isActive,
    'title': this.title,
    'createdAt': this.createdAt,
    'latitude': this.latitude,
    'longitude': this.longitude,
    'image': this.image,
    'descriptionText': this.descriptionText
  };
}