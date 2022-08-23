import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  late TextEditingController controller;
  late BuildContext context;
  late TextInputType type;
  late bool isPassword;
  late String lable;
  IconData? prefix;
  IconData? suffix;
  late Function onValidate;
  Function? onSubmit;
  Function? onChange;
  Function? onTap;
  bool isClickable = true;
  Function? onSuffixPressed;
  StrutStyle? strutStyle;
   double? width = double.infinity;
   double? height = 60;

  DefaultTextFormField(
      {required this.controller,
      required this.context,
      required this.type,
      required this.isPassword,
      required this.lable,
        required this.width,
      this.prefix,
      this.suffix,
      required this.height,
      required this.onValidate,
      this.onSubmit,
      this.onChange,
      this.onTap,
      this.isClickable = true,
      this.onSuffixPressed,
      this.strutStyle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(
          height: 2,
        ),
        SizedBox(
          width: width,
          height: height,
          child: TextFormField(

            strutStyle: strutStyle,
            keyboardType: type,
            obscureText: isPassword,
            validator: (String? value) {
              return onValidate(value);
            },
            onTap: () {
              if (onTap != null) {
                onTap!();
              } else {
                return;
              }
            },
            enabled: isClickable,
            controller: controller,
            onFieldSubmitted: (String? value) {
              if (onSubmit != null) {
                onSubmit!(value);
              } else {
                return;
              }
            },
            onChanged: (String? value) {
              if (onChange != null) {
                onChange!(value);
              } else {
                return;
              }
            },
            decoration: InputDecoration(
              suffixIcon: suffix != null
                  ? IconButton(
                      icon: Icon(suffix),
                      onPressed: () {
                        return onSuffixPressed!();
                      },
                    )
                  : null,
              prefixIcon: prefix != null ? Icon(prefix) : null,
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
