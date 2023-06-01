import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class TitleTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? titleController;

  TitleTextFormField(this.titleController, {this.enabled = true});

  @override
  State<TitleTextFormField> createState() => _TitleTextFormFieldState();
}

class _TitleTextFormFieldState extends State<TitleTextFormField> {
  FocusNode nameFocus = FocusNode();

  String? validateName() {
    if (widget.titleController!.text.isEmpty) {
      nameFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.titleController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      nameFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(BaseProjectConst.PLACEHOLDER), BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH.toString());
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        onEditingComplete: () {
          nameFocus.unfocus();
        },
        autofocus: false,
        controller: widget.titleController,
        validator: (_) => validateName(),
        textCapitalization: TextCapitalization.words,
        focusNode: nameFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.listingTitle),
        style: TextStyle(color:Colors.black),
      ),
    );
  }
}
