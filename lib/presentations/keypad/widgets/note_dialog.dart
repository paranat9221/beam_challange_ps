import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_button.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:flutter/material.dart';

const _kMaxLines = 8;
const _kMaxLength = 250;

class KeypadNoteDialog extends StatefulWidget {
  const KeypadNoteDialog({
    Key? key,
    required this.onSave,
    this.currentNote = "",
  }) : super(key: key);

  final Function(String str) onSave;
  final String currentNote;

  @override
  State<KeypadNoteDialog> createState() => _KeypadNoteDialogState();
}

class _KeypadNoteDialogState extends State<KeypadNoteDialog> {
  late final TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController(text: widget.currentNote);
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          _Header(
            textEditingController: _textEditingController,
            onSave: () {
              widget.onSave(_textEditingController.text);
            },
          ),
          _Body(
            textEditingController: _textEditingController,
          )
        ],
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({
    Key? key,
    required this.textEditingController,
  }) : super(key: key);

  final TextEditingController textEditingController;

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late int textLength;

  @override
  void initState() {
    textLength = widget.textEditingController.text.length;
    widget.textEditingController.addListener(() {
      setState(() {
        textLength = widget.textEditingController.text.length;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            appString(AppStringKeys.keypadNoteTitle),
            style: AppTextStyles.heading.xl.regular,
          ),
          const Gap(AppSpacing.md),
          Row(
            children: [
              Expanded(
                child: Text(
                  appString(AppStringKeys.keypadNoteBoxTitle),
                  style: AppTextStyles.body.b2.regular
                      .copyWith(color: AppColors.textPrimary),
                ),
              ),
              const Gap(AppSpacing.sm),
              Text(
                '${widget.textEditingController.text.length}/$_kMaxLength',
                style: AppTextStyles.body.b2.regular
                    .copyWith(color: AppColors.textPrimary),
              ),
            ],
          ),
          const Gap(AppSpacing.xs),
          TextField(
            controller: widget.textEditingController,
            maxLength: _kMaxLength,
            maxLines: _kMaxLines,
            keyboardType: TextInputType.multiline,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              counterText: "",
            ),
          ),
          const Gap(AppSpacing.xs),
          Text(
            appString(AppStringKeys.keypadNoteDesc),
            style: AppTextStyles.body.b2.regular
                .copyWith(color: AppColors.textSecondary),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key? key,
    required this.textEditingController,
    required this.onSave,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.md,
        AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
          AppButton(
            onTap: () {
              onSave();
              Navigator.of(context).pop();
            },
            title: appString(AppStringKeys.keypadNoteSaveBtn),
          )
        ],
      ),
    );
  }
}
