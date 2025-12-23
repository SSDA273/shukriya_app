import 'package:flutter/material.dart';
import 'package:unitey_app/generated/l10n.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.labelText,
        this.suffix,
        this.suffixText,
        this.prefix,
      this.obscureText,
        this.maxLength,
      this.keyboardType})
      : super(key: key);
  final String? labelText,suffixText;
  final Widget? suffix,prefix;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
      child: TextFormField(
        maxLength: maxLength,
        style: Theme.of(context).textTheme.headlineMedium,
        controller: controller,
        obscureText: obscureText ?? false,
        obscuringCharacter: "*",
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).plsEnterValue;
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 15,right: 10),
          suffixIcon: suffix,
          suffixStyle: Theme.of(context).textTheme.headlineMedium,
          prefix: prefix,
          suffixText: suffixText,
          hintText: labelText,
          hintStyle: Theme.of(context).textTheme.headlineSmall,
          focusedBorder: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
