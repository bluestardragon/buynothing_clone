import 'package:baseproject/src/base/models/listings/listing_model_response.dart';
import 'package:baseproject/src/base/models/listings/listings_filter_model.dart';
import 'package:baseproject/src/base/models/listings/listings_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';

import 'home_page_data_source.dart';

class HomePageDataSourceImpl extends HomePageDataSource {
  final Dio _dio;
  final FirebaseFirestore _firestore;
  HomePageDataSourceImpl(this._dio, this._firestore);

  @override
  Future<ListingsDetailResponse> getListings(ListingsFilterModel filters) async {
    try {
      DatabaseEvent event = await FirebaseDatabase.instance.ref("listings").once();
      int maxElementsNum = event.snapshot.children.length;
    print(filters.toJson());
      event = await FirebaseDatabase.instance.ref("listings")
          .orderByKey()
          .once();

      List<ListingModelResponse> listings = event.snapshot.children.map((e) => ListingModelResponse.fromSnapshot(e)).toList();;
      ListingsDetailResponse posts = ListingsDetailResponse(maxElementsNum:maxElementsNum, listings: listings);

      return posts;
    } catch (error, stack) {
      print(error);
      print(stack);
      return Future.error(error);
    }
  }

  /*@override
  Future<ListingsDetailResponse> getListings(ListingsFilterModel filters) async {
    try {
      Map<String, dynamic> temporaryFilters = {"pageNumber": filters.pageNumber, "totalPerPage": filters.totalPerPage};
      final Response response = await _dio.get("/v1/posts", queryParameters: temporaryFilters);
      ListingsDetailResponse posts = ListingsDetailResponse.fromJson(response.data);
      return posts;
    } catch (error, stack) {
      print(error);
      print(stack);
      return Future.error(error);
    }
  }*/
}
