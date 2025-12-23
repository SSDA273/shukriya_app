import 'package:flutter/material.dart';

import '../../../../constant/color_manger.dart';
import '../../../../constant/style_manager.dart';
import '../../../../constant/values_manger.dart';

class AddBeneficiaryTextWidget extends StatelessWidget {
  const AddBeneficiaryTextWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.isEditable=true,
    this.maxLength,
    this.minLine,
    this.maxLine,
    this.isObscureText = false,
    this.inputType = TextInputType.text,
    this.isEnable = true,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText;
  final bool isObscureText;
  final int? maxLength,minLine,maxLine;
  final TextInputType inputType;
  final bool isEnable,isEditable;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p16),
      child: TextFormField(
        controller: controller,
        style: getSemiBoldStyle(color: ColorManager.black),
        keyboardType: inputType,
        obscureText: isObscureText,


        validator:validator?? (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $labelText';
          }
          return null;
        },
        autocorrect: isEditable,
        enableSuggestions: isEditable,
        enableInteractiveSelection: isEditable,
        maxLength: maxLength,
        minLines: minLine,
        maxLines: maxLine,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          floatingLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: ColorManager.grey5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(4.0)),
            borderSide: BorderSide(color: ColorManager.grey5),
          ),
          // hintText: hintName,
          labelText: labelText,
          labelStyle: getRegularStyle(color: ColorManager.black3),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}