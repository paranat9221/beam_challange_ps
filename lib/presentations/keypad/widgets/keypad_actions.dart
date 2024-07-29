import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/app_routes.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_button.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/keypad/bloc/keypad_bloc.dart';
import 'package:beam_challange_ps/presentations/keypad/widgets/note_dialog.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_argument_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KeypadActions extends StatelessWidget {
  const KeypadActions({Key? key, required this.keypadBloc}) : super(key: key);
  final KeypadBloc keypadBloc;

  void onCharge(BuildContext context, {required double price, String? note}) {
    Navigator.of(context).pushNamed(
      AppRoutes.paymentScreen,
      arguments: PaymentArgumentViewModel(price: price, note: note),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: keypadBloc,
      builder: (context, state) {
        switch (state) {
          case KeypadMainState():
            bool isAddedNote = state.note?.isNotEmpty ?? false;
            return Row(
              children: [
                AppButton.outlined(
                  title: appString(AppStringKeys.keypadNoteBtn),
                  onTap: () {
                    showModalBottomSheet(
                      useSafeArea: true,
                      context: context,
                      isScrollControlled: true,
                      builder: (context) {
                        return KeypadNoteDialog(
                          onSave: (note) {
                            keypadBloc.add(KeypadAddNoteEvent(note));
                          },
                          currentNote: state.note ?? "",
                        );
                      },
                    );
                  },
                  prefixIcon: isAddedNote
                      ? Icon(Icons.check, color: AppColors.primary)
                      : Icon(Icons.edit, color: AppColors.textSecondary),
                  borderColor:
                      isAddedNote ? AppColors.primary : AppColors.border,
                  textStyle: AppTextStyles.body.b1.bold.copyWith(
                    color: isAddedNote
                        ? AppColors.primary
                        : AppColors.textSecondary,
                  ),
                ),
                const Gap(AppSpacing.xs),
                Expanded(
                  child: AppButton(
                    title: appString(AppStringKeys.keypadChargeBtn),
                    onTap: state.priceStr.isNotEmpty &&
                            (double.parse(state.priceStr) > 0)
                        ? () => onCharge(
                              context,
                              price: double.parse(state.priceStr),
                              note: state.note,
                            )
                        : null,
                  ),
                ),
              ],
            );
          default:
            return Container();
        }
      },
    );
  }
}
