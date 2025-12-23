import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unitey_app/constant/color_manger.dart';
import 'package:unitey_app/generated/l10n.dart';

import '../../../constant/font_manager.dart';
import '../../../constant/style_manager.dart';

class TextFieldWidget extends StatelessWidget {
  final Function() onEditFunction;
  final Function(String?) onSave;
  final String? Function(String?)? validator;
  final String? labelText, hint,suffixText;
  final FocusNode? node;
  final Widget? suffix, prefix;
  final bool? obscureText,
      autocorrect,
      enableSuggestions,
      enableInteractiveSelection,enable;
final int? maxLength;
  final TextEditingController controller;
  final Key key;
  final Widget? suffixs;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final AutovalidateMode? autovalidateMode;


  const TextFieldWidget({
    required this.onEditFunction,
    this.autovalidateMode,
    this.maxLength,
    this.enable,
    this.suffixText,
    this.onChanged,
    required this.key,
    required this.controller,
    this.inputFormatter,
    this.suffixs,
    this.hint,
    this.prefix,
    this.validator,
    this.autocorrect,
    this.enableInteractiveSelection,
    this.enableSuggestions,
    this.keyboardType,
    this.labelText,
    this.node,
    this.obscureText,
    required this.onSave,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: enable??false,
      controller: controller,
      autocorrect: autocorrect ?? true,
      inputFormatters: inputFormatter,
      maxLength: maxLength,
      enableSuggestions: enableSuggestions ?? true,
      enableInteractiveSelection: enableInteractiveSelection ?? true,
      key: key,
     style: getBoldStyle(color: ColorManager.grey,fontSize: FontSize.s14),
      focusNode: node,
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditFunction,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      validator: validator ??
          (text) {
            if (text == null || text.isEmpty) {
              return S.of(context).plsEnterValue;
            }
            return null;
          },
      onChanged: onChanged,
      autovalidateMode: autovalidateMode ??AutovalidateMode.disabled,
      decoration: InputDecoration(
        // border:  UnderlineInputBorder(
        //     borderRadius: BorderRadius.circular(20),
        //     borderSide: const BorderSide(
        //         width: 0,
        //         style: BorderStyle.none
        //     )
        //
        // ),
        // filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: ColorManager.grey5),
        ),
        floatingLabelStyle: getSemiBoldStyle(color: ColorManager.primary),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          borderSide: BorderSide(color: ColorManager.grey5),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey5,
            width: 1
          )
        ),

        suffixIcon: suffix,
        suffix: suffixs,
        prefixIcon: prefix,
        prefixIconConstraints:const BoxConstraints(minWidth: 40,),
        suffixText:suffixText ,
        hintText: hint,
        // prefix: prefix,
        labelStyle: Theme.of(context).textTheme.titleSmall,
        labelText: labelText,
        hintStyle: Theme.of(context).textTheme.titleSmall,
      ),
      onSaved: onSave,
      obscureText: obscureText ?? false,
    );
  }
}

//
// child: Theme(
// data: ThemeData(primaryColor:  Colors.red),
// child: TextFormField(
// controller: controller,
// key: key,
// style: Theme.of(context).textTheme.headline4,
// focusNode: node,
// textInputAction: TextInputAction.next,
// onEditingComplete: onEditFunction,
// keyboardType: keyboardType??TextInputType.emailAddress,
// decoration: InputDecoration(
// border:  UnderlineInputBorder(
// borderRadius: BorderRadius.circular(20),
// borderSide: const BorderSide(
// width: 0,
// style: BorderStyle.none
// )
//
// ),
// filled: true,
// suffixIcon: suffix,
//
// labelText: labelText,
//
//
// ),
// onSaved: onSave,
// obscureText: obscureText??false,
// ),
// ),);
