import 'package:baseproject/src/base/models/listings/listing_model_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_response.g.dart';

@JsonSerializable()
class ListingsDetailResponse {
  @JsonKey(name: 'posts')
  List<ListingModelResponse> listings;
  int maxElementsNum;

  ListingsDetailResponse({required this.listings, required this.maxElementsNum});

  factory ListingsDetailResponse.fromJson(Map<String, dynamic> json) => _$ListingsDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListingsDetailResponseToJson(this);
}
