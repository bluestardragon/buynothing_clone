import 'package:firebase_auth/firebase_auth.dart';

import 'package:baseproject/src/signup/domain/model/signup_response_model.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../domain/model/signup_exception.dart';
import '../../domain/model/signup_page_user_request_model.dart';
import 'signup_data_source.dart';

class SignupDataSourceImpl extends SignupDataSource {
  final Dio _dio;

  SignupDataSourceImpl(this._dio);

  Future signupUser(SignupPageUserRequestModel signupPageUserRequestModel) async {
    SignupPageUserRequestModel userModel = SignupPageUserRequestModel.fromModel(signupPageUserRequestModel);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: userModel.email,
        password: userModel.password,
      );

      user = userCredential.user;
      await user!.updateProfile(displayName: userModel.name);
      await user.reload();
      user = auth.currentUser;
      user?.sendEmailVerification();
      DatabaseReference ref = FirebaseDatabase.instance.ref("user_profiles/"+user!.uid);
      await ref.set(userModel.toJson());
      SignupResponseModel signupResponse = SignupResponseModel(success:true, error:null );
      sendEmailVerficationLink();
      return signupResponse;
    }on FirebaseAuthException catch (e){
      if (e.code == 'weak-password') {
        return Future.error(SignupException.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        return Future.error(SignupException.emailAlreadyInUse);
      }
    }catch(e){
      print(e);
      return Future.error(SignupException.genericError);
    }
    /*try {
      SignupPageUserRequestModel userModel = SignupPageUserRequestModel.fromModel(signupPageUserRequestModel);
      final response = await _dio.post(
        "/v1/signup",
        data: userModel.toJson(),
      );
      SignupResponseModel signupResponse = SignupResponseModel.fromJson(response.data);
      return signupResponse;
    } catch (e) {
      if (e == 'weak-password') {
        return Future.error(SignupException.weakPassword);
      } else if (e == 'email-already-in-use') {
        return Future.error(SignupException.emailAlreadyInUse);
      } else if (e == 'invalid-email') {
        return Future.error(SignupException.invalidEmail);
      } else
        return Future.error(SignupException.genericError);
    }*/
  }

  Future sendEmailVerficationLink() async{
    try {
      var acs = ActionCodeSettings(
        // URL you want to redirect back to. The domain (www.example.com) for this
        // URL must be whitelisted in the Firebase Console.
          url: 'https://buynothing-c2fc5.firebaseapp.com',
          // This must be true
          handleCodeInApp: true,
          iOSBundleId: 'com.baseprojectsrl.baseproject.dev',
          androidPackageName: 'com.baseprojectsrl.baseproject.dev',
          // installIfNotAvailable
          androidInstallApp: true,
          // minimumVersion
          androidMinimumVersion: '12');

      await FirebaseAuth.instance.sendSignInLinkToEmail(email: FirebaseAuth.instance.currentUser!.email!, actionCodeSettings: acs);
      print('Successfully sent email verification');
    }catch(error, stack) {
      print('Error sending email verification $error');
    }
  }
}
