import 'dart:io';

import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/src/base/models/listings/listing_model_response.dart';
import 'package:baseproject/src/home_page/ui/model/home_page_navigation_state.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'home_page_view_model_shared.dart';

class HomePageViewModelMain extends ChangeNotifier with HomePageViewModelShared, HomePageViewModel, HomePageViewModelNavigation {
  Future updateListItem(String? title, String? description, File? _image ) async{
    ListingModelResponse selectedListing = listingsList[selectedListingIndex];
    showPageLoader = true;
    notifyListeners();
    try {
      if(_image != null) {
        final fileName = basename(_image!.path);
        Reference imageRef = FirebaseStorage.instance.ref("list_images").child(
            DateTime.now().toString()).child(fileName.toString());
        await imageRef.putFile(File(_image!.path));
        final imageUrl = await imageRef.getDownloadURL();
        selectedListing.image = imageUrl;
      }
      selectedListing.title = title!;
      selectedListing.descriptionText = description??"";
      await FirebaseDatabase.instance.ref("listings").child(selectedListing.postId).set(selectedListing.toJsonForSnapshot());
      homeNavigationState = HomePageNavigationState.detailListPage;
    }catch(e, stack) {
      print(e);
      print(stack);
      showSnackBar!(translation.generic.genericError);
    }

    showPageLoader = false;
    notifyListeners();
  }
}
