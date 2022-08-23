import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/auth/cubit/cubit.dart';
import 'package:la_vie/shared/components/default_form_field.dart';

import '../../../shared/components/components.dart';

import '../../../styles/colors.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class MobileRegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var fNameController = TextEditingController();
  var lNameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      width: double.infinity,
                      height: 80,
                      child: Row(
                        verticalDirection: VerticalDirection.down,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          DefaultTextFormField(

                              width: MediaQuery.of(context).size.width*0.40,
                              height: 60,
                              controller: fNameController,
                              type: TextInputType.name,
                              isPassword: false,
                              lable: 'First Name',
                              onValidate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter your First Name';
                                }
                              },
                              context: context),
                          const Spacer(),
                          DefaultTextFormField(
                            width: MediaQuery.of(context).size.width*0.40,
                            height: 60,
                              controller: lNameController,
                              type: TextInputType.name,
                              isPassword: false,
                              lable: 'Last Name',
                              onValidate: (value) {
                                if (value.isEmpty) {
                                  return 'Please Enter your Last Name';
                                }
                              },
                              context: context,),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    defaultFormField(
                        context: context,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        isPassword: false,
                        lable: 'Email Address',
                        onValidate: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter your Email Address';
                          } else if (!EmailValidator.validate(value)) {
                            return 'Your Email Should be name@company.com ';
                          }
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                      context: context,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: RegisterCubit.get(context).isPassword,
                      lable: 'Password',
                      onValidate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter your Password';
                        }
                      },
                      onSuffixPressed: () {
                        RegisterCubit.get(context).changePasswordVisibility();
                      },
                      suffix: RegisterCubit.get(context).suffix,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    defaultFormField(
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        isPassword: true,
                        lable: 'Confirm Password',
                        onValidate: (value) {
                          if (value.isEmpty) {
                            return 'Please Enter your Confirm password';
                          }
                          if (passwordController.text !=
                              confirmPasswordController.text) {
                            return 'password and confirm password are not match';
                          }
                        },
                        onSuffixPressed: () {
                          RegisterCubit.get(context).changePassword2Visibility();
                        },
                        suffix: RegisterCubit.get(context).suffix2,
                        context: context),

                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterLoadingState,
                      builder: (context) => defaultButton(
                          height: 46.24,
                          radius: 5,
                          background: primaryColor,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              RegisterCubit.get(context).userRegister(
                                Email: emailController.text.toString(),
                                Password: passwordController.text.toString(),
                                FName: fNameController.text.toString(),
                                LName: lNameController.text.toString(),
                              );
                            }
                          },
                          text: 'register',
                          isUpperCase: true),
                      fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    Center(
                        child: Image.asset('assets/images/or-contain.png',
                            width: double.infinity, height: 100)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/google-icon.png',
                            )),
                        const SizedBox(
                          width: 30,
                        ),
                        InkWell(
                            onTap: () {},
                            child: Image.asset(
                              'assets/images/facebook-icon.png',
                            )),
                      ],
                    ),
                    // BOTTOM LEAVES //
                  ],
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is RegisterSuccessState) {
            AuthCubit.get(context).changeBottom(index: 0);
          }
        },
      ),
    );
  }
}
