import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

const String _kLottieUrl =
    'https://lottie.host/542231b1-ab0a-430d-a864-86c2433034a3/9sf1nUrn0i.json';
const double _kLottieWidth = 178;
const double _kLottiHeight = 176;

class PaymentProcessing extends StatelessWidget {
  const PaymentProcessing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.network(
                _kLottieUrl,
                width: _kLottieWidth,
                height: _kLottiHeight,
              ),
              const Gap(AppSpacing.sectionXl),
              Text(
                appString(AppStringKeys.paymentProcessingTitle),
                style: AppTextStyles.heading.h2.regular,
              ),
              const Gap(AppSpacing.sectionSm),
              Text(
                appString(AppStringKeys.paymentProcessingDesc),
                style: AppTextStyles.body.b1.regular,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
