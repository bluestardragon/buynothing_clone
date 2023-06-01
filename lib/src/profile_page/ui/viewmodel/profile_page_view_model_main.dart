import 'package:baseproject/i18n/translations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile_page_view_model_shared.dart';

class ProfilePageViewModelMain extends ChangeNotifier with ProfilePageViewModelShared, ProfilePageViewModelNavigation, ProfilePageViewModelMainPage {
  Future pwdReset() async{
    try{
      User? user = FirebaseAuth.instance.currentUser;
      AuthCredential credential = EmailAuthProvider.credential(email: user!.email!, password: oldPwd.text);
      await user.reauthenticateWithCredential(credential);
      await user?.updatePassword(newPwd.text);
      showSnackBar!(translation.generic.pwdResetSuccess);
    }on FirebaseAuthException catch (e) {
      if(e.code=='wrong-password'){
        showSnackBar!(translation.generic.pwdUpdateFailed1);
      }else{
        showSnackBar!(translation.generic.genericError);
      }
    }catch (e) {
      showSnackBar!(translation.generic.genericError);
    }
  }
}
