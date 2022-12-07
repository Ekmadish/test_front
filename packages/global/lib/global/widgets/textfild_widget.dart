import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFialdWidget extends StatelessWidget {
  const TextFialdWidget(
      {Key? key,
      this.maxLength,
      this.style,
      this.textAlign = TextAlign.start,
      this.textInputAction,
      this.autocorrect = true,
      this.onSaved,
      this.inputFormatters,
      this.vertical = 8,
      this.onFieldSubmitted,
      this.focusNode,
      this.hintText,
      // this.controller,
      this.validator,
      this.prefixIcon,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.onEditingCompleted,
      this.height = 49,
      this.width = 400,
      this.onChanged})
      : super(key: key);
  // final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final bool? obscureText;
  final bool? readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final String? errorText;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final Widget? prefixIcon;
  final FocusNode? focusNode;
  final ValueChanged<String>? onFieldSubmitted;
  final double vertical;
  final List<TextInputFormatter>? inputFormatters;
  final bool autocorrect;
  final TextStyle? style;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final int? maxLength;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: TextFormField(
          // controller: controller,
          style: style,
          maxLength: maxLength,
          textInputAction: textInputAction,
          onSaved: onSaved,
          inputFormatters: inputFormatters,
          // smartQuotesType: SmartQuotesType.enabled,
          onFieldSubmitted: onFieldSubmitted,
          autocorrect: autocorrect,
          textAlign: textAlign,
          onChanged: onChanged,
          onEditingComplete: onEditingCompleted,
          autofocus: autofocus!,
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: .4),
            border: const OutlineInputBorder(
                // borderRadius: BorderRadius.circular(30),
                ),
            hintText: hintText,
            prefixIcon: prefixIcon,
          ),
          // minLines:  isMulti! ? 4 : 1,
          // maxLines:  isMulti! ? null : 1,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly!,
          obscureText: obscureText!,
          keyboardType: keyboardType,
          // cursorRadius:  Radius.circular(0),
          // decoration: InputDecoration(
          //   errorStyle:  TextStyle(height: 0.4, color: Color(0xff453ea4)),
          //   prefixIcon:  prefixIcon,
          //   prefix:  prefix,
          //   suffixIcon:  suffix,
          //   fillColor: Colors.white,
          //   contentPadding:  EdgeInsets.all(18),
          //   filled: true,
          //   hintText:  hintText,
          //   focusedBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(4),
          //     borderSide:  BorderSide(color: Colors.blueGrey),
          //   ),
          //   border: OutlineInputBorder(
          //     borderSide:  BorderSide(color: Colors.grey),
          //     borderRadius: BorderRadius.circular(4),
          //   ),
          //   enabledBorder: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(4),
          //     borderSide:  BorderSide(color: Color(0xffab97ff)),
          //   ),
          //   focusColor: Colors.white,
          // ),
          validator: validator),
    );
  }
}
