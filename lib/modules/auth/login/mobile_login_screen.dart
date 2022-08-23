import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:la_vie/layout/home/mobile_home_layout.dart';
import 'package:la_vie/shared/network/local/cache_helper.dart';
import 'package:la_vie/styles/colors.dart';

import '../../../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/state.dart';

class MobileLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    emailController.text = 'kirolos.ibrahim65@gmail.com';
    passwordController.text = 'Ki@#123456';
    bool? rMe;

    return BlocConsumer<LoginCubit, LoginStates>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context);

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: formKey,
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      isPassword: LoginCubit.get(context).isPassword,
                      lable: 'Password',
                      onValidate: (value) {
                        if (value.isEmpty) {
                          return 'Please Enter your Password';
                        }
                      },
                      onSubmit: (value) {
                        if (formKey.currentState!.validate()) {
                          cubit.userLogin(
                              Email: emailController.text,
                              Password: passwordController.text,
                            RememberMe:  cubit.rememberMe,
                          );
                        }
                      },
                      onSuffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                      suffix: LoginCubit.get(context).suffix,
                      context: context,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Checkbox(
                            value: cubit.rememberMe,
                            onChanged: (value) {
                              if (true) {
                                cubit.changeRememberMe();
                              }
                            }),
                        const Text(
                          'Remember me.',
                          style: TextStyle(fontFamily: 'Roboto'),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) => defaultButton(
                          height: 46.24,
                          radius: 5,
                          background: primaryColor,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                  Email: emailController.text,
                                  Password: passwordController.text,
                                  RememberMe:  cubit.rememberMe,
                              );
                            }
                          },
                          text: 'login',
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
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is LoginSuccessState) {
          navigateAndFinish(context, const MobileHomeLayout());
          CacheHelper.saveData(
              key: 'rtoken', value: state.userModel.data!.refreshToken);
          CacheHelper.saveData(
              key: 'atoken', value: state.userModel.data!.accessToken);
        }

      },
    );
  }

  void connectionChecker() async {
    bool isConnected = await InternetConnectionChecker().hasConnection;
    if (isConnected) {
      showToast(text: 'Back Online', state: ToastStates.SUCCESS);
    } else {
      showToast(text: 'Offline', state: ToastStates.ERROR);
    }
  }
}
