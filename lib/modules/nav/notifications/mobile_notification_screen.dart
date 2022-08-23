import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/home/cubit/state.dart';

import '../../../layout/home/cubit/cubit.dart';

class MobileNotificationScreen extends StatelessWidget {
  const MobileNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}
