import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/app_routes.dart';
import 'package:beam_challange_ps/presentations/common/blocs/account/account_bloc.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_button.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_view_model.dart';
import 'package:beam_challange_ps/presentations/payment/widgets/payment_price_detail_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

const String _kLottieUrl =
    'https://lottie.host/e0566c58-f58b-42c2-aa00-a9af88d7a434/rcoRv570nA.json';
const double _kLottieWidth = 196;
const double _kLottieHeight = 185;

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key? key, required this.model}) : super(key: key);

  final PaymentSuccessViewModel model;

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
                repeat: false,
                width: _kLottieWidth,
                height: _kLottieHeight,
              ),
              const Gap(AppSpacing.sectionSm),
              Text(
                appString(AppStringKeys.paymentSuccessTitle),
                style: AppTextStyles.heading.xl.regular,
              ),
              const Gap(AppSpacing.sectionSm),
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  switch (state) {
                    case AccountMainState():
                      return PaymentPriceDetailBox(
                          title:
                              '${appString(AppStringKeys.paymentSuccessPaid)} ${state.account.shop.name}',
                          price: model.price);
                    default:
                      return Container();
                  }
                },
              ),
              const Gap(AppSpacing.sectionSm),
              AppButton.outlined(
                title: appString(AppStringKeys.paymentSuccessNewPaymentBtn),
                borderColor: AppColors.border,
                textStyle: AppTextStyles.body.b1.bold
                    .copyWith(color: AppColors.textSecondary),
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.homeScreen,
                    ModalRoute.withName('/'),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
