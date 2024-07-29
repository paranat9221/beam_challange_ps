import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Settings",
          style: AppTextStyles.display.d3.bold,
        ),
      ),
    );
  }
}
