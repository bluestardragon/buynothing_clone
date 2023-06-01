import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:baseproject/src/login/domain/model/login_exception.dart';
import '../../domain/model/base_user_response_model.dart';
import 'base_remote_data_source.dart';

class BaseRemoteDataSourceImpl extends BaseRemoteDataSource {
  final Dio _dio;

  BaseRemoteDataSourceImpl(this._dio);

  @override
  Future<BaseUserResponseModel> initUserDatas() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if(user == null) throw LoginException.userNotFound;

      final ref = FirebaseDatabase.instance.ref();
      final snapshot = await ref.child('user_profiles/${user!.uid}').get();
      if (snapshot.exists) {
        Map<String, dynamic> map = json.decode(json.encode(snapshot.value));
        BaseUserResponseModel res = new BaseUserResponseModel.fromJson(map);
        return res;
      } else {
        throw UnimplementedError();
      }
    } catch (err) {
      //TODO insert the correct exceptions
      throw UnimplementedError();
    }
  }

  /*@override
  Future<BaseUserResponseModel> initUserDatas() async {
    try {
      final response = await _dio.get("/v1/profile");
      print(response.data);
      BaseUserResponseModel res = BaseUserResponseModel.fromJson(response.data);
      return res;
    } catch (err) {
      throw UnimplementedError();
    }
  }*/
}
