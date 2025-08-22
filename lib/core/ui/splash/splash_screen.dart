import 'dart:async';

import 'package:double_partners/config/theme/app_colors.dart';
import 'package:double_partners/config/theme/app_dimensions.dart';
import 'package:double_partners/core/animations/fade_animation.dart';
import 'package:double_partners/core/ui/users/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  static const String screenName = 'SplashScreen';
  static const String path = '/$screenName';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goToHome() => context.pushReplacementNamed(UsersScreen.screenName);

  @override
  void initState() {
    super.initState();
    Timer(k3sec, () async {
      _goToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBlue03,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: FadeAnimation(
                duration: k3sec,
                child: Text('Double Partners', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: kWhite))
              ),
            );
          },
        ),
      ),
    );
  }
}
