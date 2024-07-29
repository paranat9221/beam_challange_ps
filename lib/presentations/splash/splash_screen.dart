import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/presentations/app_routes.dart';
import 'package:flutter/material.dart';

const String _kLogoUrl = 'assets/images/beam_logo.png';
const double _kLogoWidth = 116;
const double _kLogoHeight = 32;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.of(context).pushReplacementNamed(AppRoutes.signInScreen));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              AppColors.backgroundGradienStart,
              AppColors.backgroundGradienEnd,
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            _kLogoUrl,
            width: _kLogoWidth,
            height: _kLogoHeight,
          ),
        ),
      ),
    );
  }
}
