import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/res/app_values.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/common/widgets/shaker.dart';
import 'package:flutter/material.dart';

class SignInTextInput extends StatefulWidget {
  const SignInTextInput({
    Key? key,
    required this.title,
    this.controller,
    this.textInputAction,
    this.onEditingComplete,
    this.errorMessage = "",
    this.isPassword = false,
  }) : super(key: key);

  final String title;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final VoidCallback? onEditingComplete;
  final String errorMessage;
  final bool isPassword;

  @override
  State<SignInTextInput> createState() => _SignInTextInputState();
}

class _SignInTextInputState extends State<SignInTextInput> {
  late final FocusNode _focusNode;
  late bool obscureText;

  @override
  void initState() {
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && widget.onEditingComplete != null) {
        widget.onEditingComplete!();
      }
    });
    obscureText = widget.isPassword;

    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.xxxs),
          child: Text(
            widget.title,
            style: AppTextStyles.body.b2.regular,
          ),
        ),
        const Gap(AppSpacing.xs),
        SizedBox(
          height: AppValues.textFieldHeight,
          child: TextField(
            obscureText: obscureText,
            controller: widget.controller,
            textInputAction: widget.textInputAction,
            onTapOutside: onTapOutside,
            onEditingComplete: onEditingConplete,
            focusNode: _focusNode,
            style: AppTextStyles.body.b1.regular,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(AppSpacing.sm),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.xxs),
                borderSide: BorderSide(
                  color: widget.errorMessage.isNotEmpty
                      ? AppColors.danger
                      : AppColors.border,
                  width: AppValues.textInputBorder,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(AppSpacing.xxs),
              ),
              suffixIcon: widget.isPassword ? _seePasswordIcon() : _clearIcon(),
            ),
          ),
        ),
        if (widget.errorMessage.isNotEmpty) ...[
          const Gap(AppSpacing.xs),
          ShakeWidget(
            key: Key(widget.errorMessage),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: AppColors.textDanger,
                ),
                const Gap(AppSpacing.xs),
                Text(
                  widget.errorMessage,
                  style: AppTextStyles.body.b2.regular.copyWith(
                    color: AppColors.textDanger,
                  ),
                )
              ],
            ),
          )
        ],
      ],
    );
  }

  Widget _seePasswordIcon() {
    return GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: const Icon(Icons.remove_red_eye));
  }

  Widget _clearIcon() {
    return GestureDetector(
        onTap: () {
          widget.controller?.text = "";
        },
        child: const Icon(Icons.cancel_outlined));
  }

  void onTapOutside(event) {
    _focusNode.unfocus();
  }

  void onEditingConplete() {
    if (widget.textInputAction == TextInputAction.next) {
      _focusNode.nextFocus();
    } else {
      _focusNode.unfocus();
    }
  }
}
