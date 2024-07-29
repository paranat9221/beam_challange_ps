import 'package:beam_challange_ps/presentations/home/home_screen.dart';
import 'package:beam_challange_ps/presentations/payment/payment_screen.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_argument_view_model.dart';
import 'package:beam_challange_ps/presentations/sign_in/sign_in_screen.dart';
import 'package:beam_challange_ps/presentations/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash';
  static const String signInScreen = '/signIn';
  static const String homeScreen = '/home';
  static const String paymentScreen = '/payment';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: (context) => const SplashScreen(),
      signInScreen: (context) => const SignInScreen(),
      homeScreen: (context) => const HomeScreen(),
      paymentScreen: (context) => PaymentScreen(
          args: ModalRoute.of(context)!.settings.arguments
              as PaymentArgumentViewModel),
    };
  }
}
