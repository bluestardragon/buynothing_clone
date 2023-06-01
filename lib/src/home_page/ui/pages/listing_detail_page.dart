import 'package:baseproject/src/base/models/listings/listing_model_response.dart';
import 'package:baseproject/src/home_page/ui/model/home_page_navigation_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:baseproject/src/base/widget/ui/app_bar_title.dart';
import 'package:baseproject/src/home_page/ui/viewmodel/home_page_view_model_main.dart';
import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/resources/res.dart';

class ListingDetailPage extends StatelessWidget {
  final Function()? onPop;
  final HomePageViewModelMain viewModel;

  const ListingDetailPage({
    Key? key,
    this.onPop,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ListingModelResponse selectedList = viewModel.listingsList[viewModel.selectedListingIndex];
    print("${selectedList.creatorId} === ${FirebaseAuth.instance.currentUser!.uid}");
    return WillPopScope(
      onWillPop: () => onPop!(),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: ""),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: onPop,
          ),
          actions: [
            if(selectedList.creatorId == FirebaseAuth.instance.currentUser!.uid)
              IconButton(
                icon: Icon(Icons.create),
                onPressed: () {
                  // Perform search action
                  viewModel.homeNavigationState = HomePageNavigationState.editListPage;
                },
              ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: Sizes.padding),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.padding),
            ),
            FadeInImage.assetNetwork(
                placeholder: ImageSrc.logo,
                image: selectedList.image,
                width: MediaQuery.of(context).size.width,
                height: 400, fit: BoxFit.fitWidth),
            const SizedBox(height: Sizes.paddingXS),
            Text(selectedList.title),
            const SizedBox(height: Sizes.paddingXS),
            Text(selectedList.descriptionText??""),
          ],
        ),
      ),
    );
  }
}
