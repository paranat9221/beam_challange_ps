import 'package:beam_challange_ps/core/localization/app_localizations_delegate.dart';
import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/presentations/app_routes.dart';
import 'package:beam_challange_ps/presentations/common/blocs/account/account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AccountBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Beam Challange by Paranat S.',
        localizationsDelegates: const [AppLocalizationsDelegate()],
        theme: ThemeData(
            scaffoldBackgroundColor: AppColors.background,
            appBarTheme: AppBarTheme(backgroundColor: AppColors.background),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: AppColors.background,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              primary: AppColors.primary,
              secondary: AppColors.secondary,
            ),
            useMaterial3: true,
            textTheme: GoogleFonts.interTextTheme(),
            dividerTheme: DividerThemeData(space: 1, color: AppColors.border)),
        initialRoute: AppRoutes.splashScreen,
        routes: AppRoutes.getRoutes(),
      ),
    );
  }
}
