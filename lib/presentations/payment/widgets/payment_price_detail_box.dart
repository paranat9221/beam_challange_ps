import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/core/utils/text_util.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:flutter/material.dart';

const String _kBahtSign = "฿";

class PaymentPriceDetailBox extends StatelessWidget {
  const PaymentPriceDetailBox({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceSecondary,
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const Gap(AppSpacing.sectionXs),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _kBahtSign,
                style: AppTextStyles.display.baht2.medium,
              ),
              const Gap(AppSpacing.xs),
              Text(
                formattedPrice(price),
                style: AppTextStyles.display.d4.regular,
              ),
            ],
          )
        ],
      ),
    );
  }
}
