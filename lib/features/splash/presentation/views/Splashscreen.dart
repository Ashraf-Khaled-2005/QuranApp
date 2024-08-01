import 'package:flutter/material.dart';
import 'package:quran/features/splash/presentation/views/widget/splashbody.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreenBody(),
    );
  }
}
