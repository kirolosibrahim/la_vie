import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required BuildContext context,
  required TextInputType type,
  required bool isPassword,
  required String lable,
  IconData? prefix,
  IconData? suffix,
  required Function onValidate,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isClickable = true,
  Function? onSuffixPressed,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.caption,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 1.0,
          ),
          child: SizedBox(
            height: 40,
            child: TextFormField(
              keyboardType: type,
              obscureText: isPassword,
              style: const TextStyle(
                  fontWeight: FontWeight.normal, color: Colors.black54),
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              validator: (String? value) {
                return onValidate(value);
              },
              onTap: () {
                if (onTap != null) {
                  onTap();
                } else {
                  return;
                }
              },
              enabled: isClickable,
              controller: controller,
              onFieldSubmitted: (String? value) {
                if (onSubmit != null) {
                  onSubmit(value);
                } else {
                  return;
                }
              },
              onChanged: (String? value) {
                if (onChange != null) {
                  onChange(value);
                } else {
                  return;
                }
              },
              decoration: InputDecoration(
                errorMaxLines: 1,
                errorStyle: const TextStyle(
                  fontSize: 11,
                ),
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
        ),
      ],
    );
