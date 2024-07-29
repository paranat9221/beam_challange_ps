import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_button.dart';
import 'package:beam_challange_ps/presentations/keypad/bloc/keypad_bloc.dart';
import 'package:beam_challange_ps/presentations/keypad/view_model/keypad_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const int _kNumpadCol = 3;
const double _kMainAxisSpacing = AppSpacing.xs;
const double _kCrossAxisSpacing = AppSpacing.xs;

class KeypadInputs extends StatelessWidget {
  KeypadInputs({Key? key, required this.keypadBloc}) : super(key: key);

  final KeypadBloc keypadBloc;

  final List<KeypadInputViewModel> btns = [
    KeypadInputViewModel(
      child: const _KeypadInputText("1"),
      type: KeypadType.value,
      value: 1,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("2"),
      type: KeypadType.value,
      value: 2,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("3"),
      type: KeypadType.value,
      value: 3,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("4"),
      type: KeypadType.value,
      value: 4,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("5"),
      type: KeypadType.value,
      value: 5,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("6"),
      type: KeypadType.value,
      value: 6,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("7"),
      type: KeypadType.value,
      value: 7,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("8"),
      type: KeypadType.value,
      value: 8,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("9"),
      type: KeypadType.value,
      value: 9,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("."),
      type: KeypadType.dot,
    ),
    KeypadInputViewModel(
      child: const _KeypadInputText("0"),
      type: KeypadType.value,
      value: 0,
    ),
    KeypadInputViewModel(
      child: Icon(Icons.backspace_rounded, color: AppColors.textPrimary),
      type: KeypadType.del,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int kNumpadRow = (btns.length / _kNumpadCol).ceil();

        double itemWidth =
            ((constraints.maxWidth - ((_kNumpadCol - 1) * _kCrossAxisSpacing)) /
                _kNumpadCol);

        double itemHeight =
            (constraints.maxHeight - ((kNumpadRow - 1) * _kMainAxisSpacing)) /
                kNumpadRow;

        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _kNumpadCol,
            childAspectRatio: itemWidth / itemHeight,
            mainAxisSpacing: _kMainAxisSpacing,
            crossAxisSpacing: _kCrossAxisSpacing,
          ),
          itemCount: btns.length,
          itemBuilder: (context, index) {
            return _KeypadInputBtn(
              keypadInput: btns[index],
              keypadBloc: keypadBloc,
            );
          },
        );
      },
    );
  }
}

class _KeypadInputText extends StatelessWidget {
  const _KeypadInputText(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.heading.xl.semiLight
          .copyWith(color: AppColors.textPrimary),
    );
  }
}

class _KeypadInputBtn extends StatelessWidget {
  const _KeypadInputBtn({
    Key? key,
    required this.keypadInput,
    required this.keypadBloc,
  }) : super(key: key);

  final KeypadInputViewModel keypadInput;
  final KeypadBloc keypadBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: keypadBloc,
      builder: (context, state) {
        switch (state) {
          case KeypadMainState():
            return AppButton.outlined(
              onTap: () {
                switch (keypadInput.type) {
                  case KeypadType.value:
                    return keypadBloc.add(KeypadAddEvent(keypadInput.value));
                  case KeypadType.dot:
                    return keypadBloc.add(const KeypadDotEvent());
                  case KeypadType.del:
                    return keypadBloc.add(const KeypadDelEvent());
                }
              },
              borderColor:
                  state.isDigitsInput && (keypadInput.type == KeypadType.dot)
                      ? AppColors.primary
                      : AppColors.border,
              borderRadius: BorderRadius.circular(AppSpacing.sm),
              child: keypadInput.child,
            );
          default:
            return Container();
        }
      },
    );
  }
}
