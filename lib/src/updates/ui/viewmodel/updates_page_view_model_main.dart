import 'dart:io';

import 'package:baseproject/i18n/translations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import 'updates_page_view_model_shared.dart';

class AddListingPageViewModelMain extends ChangeNotifier with UpdatesPageViewModelShared, UpdatesPageViewModel {
  int imagePickingState = 0;///0:Picking, 1:Pick-Canceled, 2:Picked
  PickedFile? pickedFile;
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  void imagePicked(PickedFile? pickedFile) {
    if(pickedFile==null){
      imagePickingState = 1;
      baseViewModel.bottomMenuIndex = 0;
    }else{
      imagePickingState = 2;
      this.pickedFile = pickedFile;
    }
    notifyListeners();
  }

  Future addList() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    showPageLoader = true;
    notifyListeners();
    final fileName = basename(pickedFile!.path);
    Reference imageRef = FirebaseStorage.instance.ref("list_images").child(DateTime.now().toString()).child(fileName.toString());
    try {
      await imageRef.putFile(File(pickedFile!.path));
      final imageUrl = await imageRef.getDownloadURL();
      Map<String, dynamic> data = {
        'creatorId':user!.uid,
        'creatorName':baseViewModel.userModel?.username,
        'duration':0,
        'isActive':true,
        'title':title.text,
        'createdAt': ServerValue.timestamp,
        'latitude':0.01,
        'longitude':0.01,
        'image':imageUrl,
        'descriptionText':description.text
      };

      await FirebaseDatabase.instance.ref("listings").push().set(data);
      baseViewModel.bottomMenuIndex = 0;
    } catch (e,stack) {
      print(e);
      print(stack);
      showSnackBar!(translation.generic.genericError);
    }
      //PostsFilterModel filterModel = PostsFilterModel(pageNumber: pageNum, totalPerPage: selectedFiltersForPost.totalPerPage);
      //await updatePosts(filterModel: filterModel, addPosts: true);
      showPageLoader = false;
      notifyListeners();
  }
}
