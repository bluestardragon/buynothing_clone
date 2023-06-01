import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/model/login_exception.dart';
import '../../domain/model/login_response_model.dart';
import 'login_data_source.dart';

class LoginDataSourceImpl extends LoginDataSource {
  final Dio _dio;

  LoginDataSourceImpl(this._dio);

  Future<LoginResponseModel> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      ///LoginResponseModel loginResponse = LoginResponseModel.fromJson(response.data);
      LoginResponseModel loginResponse = LoginResponseModel(token:"", refreshToken: "", timeout: 0);
      return loginResponse;
    }catch(e){
      if(e is FirebaseAuthException ){
        if (e.code == 'user-not-found') {
          throw LoginException.userNotFound;
        } else if (e.code == 'wrong-password') {
          throw LoginException.wrongPassword;
        } else if(e.code == 'too-many-requests') {
          throw LoginException.tooManyRequest;
        }
      }
      throw LoginException.genericError;
    }
  }

  /*Future<LoginResponseModel> loginUser(String email, String password) async {
    try {
      final networkModel = {"email": email, "password": password};
      final response = await _dio.post(
        "/v1/login",
        data: networkModel,
      );
      LoginResponseModel loginResponse = LoginResponseModel.fromJson(response.data);
      return loginResponse;
    } catch (err) {
      //TODO insert the read error responses
      if (err == "user_not_found") {
        throw LoginException.userNotFound;
      } else if (err == "wrong_password") {
        throw LoginException.wrongPassword;
      } else if (err == "email_not_verified") {
        throw LoginException.emailNotVerified;
      } else if (err == "too_many_request") {
        throw LoginException.tooManyRequest;
      } else
        throw LoginException.genericError;
    }
  }*/
}
