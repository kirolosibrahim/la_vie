
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:page_transition/page_transition.dart';

import '../../../layout/auth/mobile_auth_layout.dart';


class MobileSplashScreen extends StatelessWidget {
  const MobileSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
        duration: 2000,
        splash:defaultLogo(fontSize: 36),
        nextScreen:  MobileAuthLayout(),
        splashTransition: SplashTransition.slideTransition,
        pageTransitionType:PageTransitionType.fade ,
        backgroundColor: Colors.white
    );
  }
}
