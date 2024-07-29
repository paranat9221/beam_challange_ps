import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/blocs/account/account_bloc.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_view_model.dart';
import 'package:beam_challange_ps/presentations/payment/widgets/payment_price_detail_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

const double _kQrSize = 212;
const String _kPromptPayIconPath = 'assets/images/promptPay.png';
const double _kPromptPayIconWidth = 120;
const double _kPromptPayIconHeight = 40;

class PaymentQr extends StatefulWidget {
  const PaymentQr(this.paymentQr, {Key? key}) : super(key: key);

  final PaymentQrViewModel paymentQr;

  @override
  State<PaymentQr> createState() => _PaymentQrState();
}

class _PaymentQrState extends State<PaymentQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appString(AppStringKeys.paymentAppBarTitle),
          style: AppTextStyles.heading.h4.medium,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                _kPromptPayIconPath,
                width: _kPromptPayIconWidth,
                height: _kPromptPayIconHeight,
              ),
              const Gap(AppSpacing.sectionMd),
              SizedBox(
                width: _kQrSize,
                height: _kQrSize,
                child: QrImageView(data: widget.paymentQr.qr),
              ),
              const Gap(AppSpacing.sectionMd),
              BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  switch (state) {
                    case AccountMainState():
                      return PaymentPriceDetailBox(
                        title:
                            '${appString(AppStringKeys.paymentPay)} ${state.account.shop.name}',
                        price: widget.paymentQr.price,
                      );
                    default:
                      return Container();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
