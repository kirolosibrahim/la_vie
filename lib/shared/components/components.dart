import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultLogo({
  required double fontSize,
   double? height,
   double? width,
}) =>
    Container(
      height:height ,
      width:width ,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Text('La Via',
            style: TextStyle(
                fontFamily: 'Meddon',
                height: 2.5,
                fontSize: fontSize,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
        const Image(
          image: AssetImage(
            'assets/images/logo-leaves.png',
          ),
          fit: BoxFit.fill,
        ),
      ]),
    );


Widget defaultButton({
  double width = double.infinity,
  double height = 35,
  double radius = 0,
  Color background = Colors.blue,
  bool isUpperCase = true,
  required Function function,
  required String text,
}) =>
    SizedBox(
      width: width,
      child: MaterialButton(
        height: height,
        color: background,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        onPressed: () {
          return function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

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
  StrutStyle? strutStyle,
}) =>
    Column(

      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 2,),
        SizedBox(

          height: 50,
          child: TextFormField(

            strutStyle: strutStyle,
            keyboardType: type,

            obscureText: isPassword,
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
              suffixIcon: suffix != null
                  ? IconButton(
                      icon: Icon(suffix),
                      onPressed: () {
                        return onSuffixPressed!();
                      },
                    )
                  : null,
              prefixIcon: prefix != null ? Icon(prefix) : null,
                    border:  const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );

Widget defaultTextButton(
        {required Function onPressed,
        required String text,
        TextButton? textButtonStyle}) =>
    TextButton(
      onPressed: () {
        return onPressed();
      },
      style: TextButton.styleFrom(
        //<-- SEE HERE
        side: const BorderSide(width: 50.0),
      ),
      child: Text(text.toUpperCase()),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
