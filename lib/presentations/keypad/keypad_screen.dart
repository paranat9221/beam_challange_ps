import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/res/app_values.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/keypad/bloc/keypad_bloc.dart';
import 'package:beam_challange_ps/presentations/keypad/view_model/keypad_view_model.dart';
import 'package:beam_challange_ps/presentations/keypad/widgets/keypad_actions.dart';
import 'package:beam_challange_ps/presentations/keypad/widgets/keypad_display.dart';
import 'package:beam_challange_ps/presentations/keypad/widgets/keypad_inputs.dart';
import 'package:flutter/material.dart';

class KeypadScreen extends StatefulWidget {
  const KeypadScreen({Key? key}) : super(key: key);

  @override
  State<KeypadScreen> createState() => _KeypadScreenState();
}

class _KeypadScreenState extends State<KeypadScreen> {
  late final KeypadViewModel _keypad;
  late final KeypadBloc _keypadBloc;

  @override
  void initState() {
    _keypad = KeypadViewModel();
    _keypadBloc = KeypadBloc();

    super.initState();
  }

  @override
  void dispose() {
    _keypadBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: AppValues.keypadPaddingTop,
          bottom: AppValues.keypadPaddingBottom,
          left: AppValues.mainPadding,
          right: AppValues.mainPadding,
        ),
        child: Column(
          children: [
            KeypadDisplay(keypad: _keypad, keypadBloc: _keypadBloc),
            const Gap(AppSpacing.sectionSm),
            Expanded(child: KeypadInputs(keypadBloc: _keypadBloc)),
            const Gap(AppSpacing.sectionSm),
            KeypadActions(keypadBloc: _keypadBloc),
          ],
        ),
      ),
    );
  }
}
