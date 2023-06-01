import 'dart:io';

import 'package:baseproject/src/base/widget/ui/paginated_list.dart';
import 'package:baseproject/src/base/widget/ui/post_card.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/desc_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/name_text_form_field.dart';
import 'package:baseproject/src/base/widget/ui/text_form_fields/title_text_form_field.dart';
import 'package:baseproject/src/updates/ui/model/updates_page_navigation_state.dart';
import 'package:baseproject/src/updates/ui/viewmodel/updates_page_view_model_main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../i18n/translations.dart';
import '../../../../resources/res.dart';
import '../../../base/widget/ui/custom_circular_progress_indicator.dart';

class AddListingPage extends StatefulWidget {
  final AddListingPageViewModelMain viewModel;
  final Future<bool> Function()? onPop;

  const AddListingPage({
    required this.viewModel,
    required this.onPop,
  });

  @override
  _AddListingPageState createState() => _AddListingPageState();
}

class _AddListingPageState extends State<AddListingPage> {

  ScrollController scrollControllerUpdates = ScrollController();
  ScrollController scrollControllerUsers = ScrollController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showSelectSourceBottomSheet(context));
  }

  void _showSnackbar(BuildContext context, String message) {
    if (message.isNotEmpty) {
      SnackBar snackBar = SnackBar(content: Text(message), behavior: SnackBarBehavior.floating);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void _showSelectSourceBottomSheet(BuildContext context) {
    showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Choose one for taking image'),
                ElevatedButton(
                  child: const Text('Camera'),
                  onPressed: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                ),
                const SizedBox(height: Sizes.paddingXS),
                ElevatedButton(
                  child: const Text('Gallery'),
                  onPressed: (){
                    Navigator.pop(context, ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    ).then((value){
      if(value==null){
        widget.viewModel.imagePicked(null);
        return;
      }
      _onImageButtonPressed(value,  context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.viewModel.showSnackBar = (message) => _showSnackbar(context, message);
    if(widget.viewModel.imagePickingState<2 ){
      return WillPopScope(
          onWillPop: widget.onPop,
          child: SafeArea(
            child: Container(),
          )
      );
    }
    return WillPopScope(
      onWillPop: widget.onPop,
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      controller: scrollControllerUpdates,
                      children: [
                        const SizedBox(height: Sizes.paddingM,),
                        Padding(
                          padding: const EdgeInsets.all(Sizes.padding),
                        ),
                        Image.file(File(widget.viewModel.pickedFile!.path), width: MediaQuery.of(context).size.width, height: 300, fit: BoxFit.fitWidth),
                        SizedBox(height: Sizes.paddingS),
                        TitleTextFormField(widget.viewModel.title),
                        SizedBox(height: Sizes.paddingS),
                        DescriptionTextFormField(widget.viewModel.description),
                        Padding(
                          padding: EdgeInsets.all(Sizes.paddingL),
                          child: Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: (){
                                    widget.viewModel.addList();
                                  },
                                  child: Text(translation.updatesPage.addLbl),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
            if (widget.viewModel.showPageLoader) CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed(ImageSource source, {required BuildContext context, bool isMultiImage = false}) async {
    if (context.mounted) {
      try {
        PickedFile? pickedFile = await _picker.getImage(source: source);
        widget.viewModel.imagePicked(pickedFile);
      } catch (e, stack) {
        print(e);
        print(stack);
        widget.viewModel.imagePicked(null);
      }
    }
  }
}
