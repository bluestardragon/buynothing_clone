import 'package:json_annotation/json_annotation.dart';

part 'listings_filter_model.g.dart';

@JsonSerializable()
class ListingsFilterModel {
  int? pageNumber;
  int? totalPerPage;
  String? keyword;
  //ADD ANY TYPE OF FILTERS

  ListingsFilterModel({
    this.pageNumber,
    this.totalPerPage,
  });

  factory ListingsFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ListingsFilterModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListingsFilterModelToJson(this);
}
