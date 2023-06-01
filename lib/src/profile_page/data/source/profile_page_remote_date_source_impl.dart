import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../base/base_navigation/domain/model/base_user_response_model.dart';
import '../../domain/model/profile_page_user_request_model.dart';
import 'profile_page_data_source.dart';

class ProfilePageDataSourceImpl extends ProfilePageDataSource {
  final Dio _dio;
  final FirebaseFirestore _firestore;
  ProfilePageDataSourceImpl(this._dio, this._firestore);

  Future<BaseUserResponseModel> saveUserChanges(ProfilePageUserRequestModel pageUserRequestModel) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseDatabase.instance.ref("user_profiles").child(uid).set(pageUserRequestModel.toJson());
    BaseUserResponseModel responseModel = BaseUserResponseModel.fromJson(pageUserRequestModel.toJson());
    return responseModel;
  }

  /*Future<BaseUserResponseModel> saveUserChanges(ProfilePageUserRequestModel pageUserRequestModel) async {
    try {
      final response = await _dio.put(
        "/v1/profile",
        queryParameters: pageUserRequestModel.toJson(),
      );
      print(response.data);
      BaseUserResponseModel responseModel = BaseUserResponseModel.fromJson(response.data);
      return responseModel;
    } catch (e) {
      rethrow;
    }
  }*/
}
