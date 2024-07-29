import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/res/app_values.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:flutter/material.dart';

const double _kLoadingIndicatorSize = 12;
const double _kLoadingIndicatorThickness = 1;

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    this.child,
    this.title = "",
    this.onTap,
    this.width,
    this.height,
    this.style,
    this.textStyle,
    this.prefixIcon,
    this.isLoading = false,
  }) : super(key: key);

  final Widget? child;
  final String title;
  final VoidCallback? onTap;
  final double? width;
  final double? height;
  final ButtonStyle? style;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onTap,
      style: style ??
          ElevatedButton.styleFrom(
            backgroundColor: AppColors.secondary,
            elevation: 0,
            minimumSize: Size(width ?? 0, height ?? AppValues.btnHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSpacing.xs),
            ),
          ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null || isLoading) ...[
            isLoading
                ? const SizedBox(
                    width: _kLoadingIndicatorSize,
                    height: _kLoadingIndicatorSize,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: _kLoadingIndicatorThickness,
                    ))
                : prefixIcon!,
            const Gap(AppSpacing.xs),
          ],
          child ??
              Text(
                title,
                style: textStyle ??
                    AppTextStyles.body.b1.bold.copyWith(color: AppColors.white),
              ),
        ],
      ),
    );
  }

  factory AppButton.full({
    required String title,
    required VoidCallback onTap,
    bool isLoading = false,
  }) {
    return AppButton(
      title: title,
      onTap: onTap,
      width: double.infinity,
      isLoading: isLoading,
    );
  }

  factory AppButton.outlined({
    Widget? child,
    String title = "",
    VoidCallback? onTap,
    Widget? prefixIcon,
    Color? borderColor,
    BorderRadius? borderRadius,
    TextStyle? textStyle,
  }) {
    return AppButton(
      title: title,
      prefixIcon: prefixIcon,
      onTap: onTap,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        elevation: 0,
        minimumSize: const Size(0, AppValues.btnHeight),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(AppSpacing.xs),
          side: BorderSide(width: 1, color: borderColor ?? AppColors.primary),
        ),
      ),
      textStyle: textStyle ??
          AppTextStyles.body.b1.bold.copyWith(color: AppColors.primary),
      child: child,
    );
  }
}
