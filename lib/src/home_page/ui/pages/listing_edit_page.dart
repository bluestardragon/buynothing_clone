import 'dart:io';

import 'package:baseproject/src/base/models/listings/listing_model_response.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/desc_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/title_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:baseproject/src/base/widget/ui/app_bar_title.dart';
import 'package:baseproject/src/home_page/ui/viewmodel/home_page_view_model_main.dart';
import 'package:baseproject/i18n/translations.dart';
import 'package:baseproject/resources/res.dart';
import 'package:image_picker/image_picker.dart';

class ListingEditPage extends StatefulWidget {
  final Function()? onPop;
  final HomePageViewModelMain viewModel;

  const ListingEditPage({
    Key? key,
    this.onPop,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<ListingEditPage> createState() =>_ListingEditPage();

}
class _ListingEditPage extends State<ListingEditPage> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  @override
  void initState() {
    title.text = widget.viewModel.listingsList[widget.viewModel.selectedListingIndex].title;
    description.text = widget.viewModel.listingsList[widget.viewModel.selectedListingIndex].descriptionText??"";
  }

  @override
  Widget build(BuildContext context) {
    ListingModelResponse selectedList = widget.viewModel.listingsList[widget.viewModel.selectedListingIndex];
    return WillPopScope(
      onWillPop: () => widget.onPop!(),
      child: Scaffold(
        appBar: AppBar(
          title: AppBarTitle(title: ""),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: widget.onPop,
          ),
          actions: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  // Perform search action
                  _onUpdateList();
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
            GestureDetector(
              onTap: getImage,
              child: _image == null
                  ? FadeInImage.assetNetwork(
                  placeholder: ImageSrc.logo,
                  image: selectedList.image,
                  width: MediaQuery.of(context).size.width,
                  height: 400, fit: BoxFit.fitWidth)
                  : Container(
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_image!),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),

            SizedBox(height: Sizes.paddingS),
            TitleTextFormField(title),
            SizedBox(height: Sizes.paddingS),
            DescriptionTextFormField(description),
          ],
        ),
      ),
    );
  }

  Future _onUpdateList() async {
    widget.viewModel.updateListItem(title.text, description.text, _image);
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
