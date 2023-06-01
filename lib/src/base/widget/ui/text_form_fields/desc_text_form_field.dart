import 'package:baseproject/resources/res.dart';
import 'package:flutter/material.dart';

import '../../../../../i18n/translations.dart';

class DescriptionTextFormField extends StatefulWidget {
  final bool enabled;
  final TextEditingController? descController;

  DescriptionTextFormField(this.descController, {this.enabled = true});

  @override
  State<DescriptionTextFormField> createState() => _DescTextFormFieldState();
}

class _DescTextFormFieldState extends State<DescriptionTextFormField> {
  FocusNode descFocus = FocusNode();

  String? validateName() {
    if (widget.descController!.text.isEmpty) {
      descFocus.requestFocus();
      return translation.textFieldValidations.textFormFieldEmpty;
    } else if (widget.descController!.text.length > BaseProjectConst.NORMAL_TEXTFORMFIELD_MAX_LENGTH) {
      descFocus.requestFocus();
      return translation.textFieldValidations.maxLenght.replaceAll(new RegExp(BaseProjectConst.PLACEHOLDER), BaseProjectConst.DESCRIPTION_TEXTFORMFIELD_MAX_LENGTH.toString());
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        enabled: widget.enabled,
        onEditingComplete: () {
          descFocus.unfocus();
        },
        autofocus: false,
        controller: widget.descController,
        validator: (_) => validateName(),
        textCapitalization: TextCapitalization.words,
        focusNode: descFocus,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(hintText: translation.textFormFieldHints.listingDesc),
        style: TextStyle(color:Colors.black),
        maxLines: 5,
      ),
    );
  }
}
