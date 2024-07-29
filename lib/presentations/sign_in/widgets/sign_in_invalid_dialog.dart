import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_button.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:flutter/material.dart';

class SignInInvalidDialog extends StatelessWidget {
  const SignInInvalidDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          color: AppColors.white,
        ),
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              appString(AppStringKeys.signInSubmitPopupInvalidTitle),
              style: AppTextStyles.heading.lg.regular,
            ),
            const Gap(AppSpacing.sectionMd),
            Text(
              appString(AppStringKeys.signInSubmitPopupInvalidDesc),
              style: AppTextStyles.body.md.regular
                  .copyWith(color: AppColors.textSecondary),
            ),
            const Gap(AppSpacing.sectionMd),
            AppButton.full(
              title: appString(AppStringKeys.signInSubmitPopupInvalidBtn),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
