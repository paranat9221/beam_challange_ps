import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/core/utils/text_util.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/keypad/bloc/keypad_bloc.dart';
import 'package:beam_challange_ps/presentations/keypad/view_model/keypad_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _kBahtSign = '฿';

class KeypadDisplay extends StatelessWidget {
  const KeypadDisplay({
    Key? key,
    required this.keypad,
    required this.keypadBloc,
  }) : super(key: key);

  final KeypadViewModel keypad;
  final KeypadBloc keypadBloc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          _kBahtSign,
          style: AppTextStyles.display.baht.regular,
        ),
        const Gap(AppSpacing.xs),
        BlocBuilder(
          bloc: keypadBloc,
          builder: (context, state) {
            switch (state) {
              case KeypadMainState():
                return Text(
                  state.priceStr.isEmpty
                      ? formattedPrice(0)
                      : formattedPrice(double.parse(state.priceStr)),
                  style: AppTextStyles.display.d3.regular,
                );
              default:
                return Container();
            }
          },
        ),
      ],
    );
  }
}
