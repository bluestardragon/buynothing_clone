import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../base/settings/ui/viewmodel/theme_viewmodel.dart';
import '../../../base/token/domain/token_repository.dart';
import '../model/start_page_navigator_state.dart';

part 'start_page_view_model_first_page.dart';
part 'start_page_view_model_navigation.dart';
part 'start_page_view_model_second_page.dart';

mixin StartPageViewModelShared on ChangeNotifier {
  Function(String)? showSnackBarInLoginPage;
  Function(String)? showSnackBarInStartPage;
  Function(String)? showSnackBar;
  late TokenRepository tokenRepository;

  update(
    BuildContext context,
    FirebaseMessaging firebaseMessaging,
    FirebaseApp firebaseApp,
    TokenRepository tknRepository,
    ThemeViewModel themeViewModel,
  ) async {
    tokenRepository = tknRepository;
    fetchUser();
  }

  //if user is signed in: open base navigator
  //is user is not signed in: open start page
  void logOut() async {
    ///await tokenRepository.deleteToken();
    await FirebaseAuth.instance.signOut();
    navigationState = StartPageNavigationState.startPage;
    fetchUser();
  }

  Future fetchUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;

    // Check if the user is signed in when the app starts
    User? user = auth.currentUser;
    if (user == null ) {
      if (navigationState == StartPageNavigationState.intro) {
        Future.delayed(Duration(seconds: 2), () => navigationState = StartPageNavigationState.loginPage);
      }
      print('User is currently signed out!');
    } else {
      navigationState = StartPageNavigationState.homePage;
      print('User is signed in!');
    }
    /*try {
      return tokenRepository.getToken().asStream().listen((token) {
        if (token == null || token.isEmpty) {
          if (navigationState == StartPageNavigationState.intro) {
            //This is just for the presentation for a correct use, we consider using a proper splash screen
            ///Future.delayed(Duration(seconds: 2), () => navigationState = StartPageNavigationState.startPage);
            Future.delayed(Duration(seconds: 2), () => navigationState = StartPageNavigationState.loginPage);
          }
          print('User is currently signed out!');
        } else {
          navigationState = StartPageNavigationState.homePage;
          print('User is signed in!');
        }
      });
    } catch (e) {
      Future.delayed(Duration(seconds: 2), () => navigationState = StartPageNavigationState.startPage);
      print(e);
    }*/
  }

  StartPageNavigationState _navigationState = StartPageNavigationState.intro;

  StartPageNavigationState get navigationState => _navigationState;

  set navigationState(StartPageNavigationState state) {
    _navigationState = state;
    notifyListeners();
  }
}
