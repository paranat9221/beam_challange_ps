import 'package:beam_challange_ps/core/res/app_colors.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/presentations/common/blocs/account/account_bloc.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(
      builder: (context, state) {
        switch (state) {
          case AccountMainState():
            return Row(
              children: [
                state.account.imageUrl != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(state.account.imageUrl!))
                    : CircleAvatar(
                        child: Text(
                            state.account.email.substring(0, 1).toUpperCase()),
                      ),
                const Gap(AppSpacing.xs),
                Expanded(
                  child: Text(
                    state.account.email,
                    style: AppTextStyles.body.b2.regular,
                  ),
                ),
                const Gap(AppSpacing.lg),
                state.account.shop.imageUrl != null
                    ? Image.network(state.account.shop.imageUrl!)
                    : CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          state.account.shop.name.substring(0, 1).toUpperCase(),
                        ),
                      ),
              ],
            );
          default:
            return const Text('not login yet');
        }
      },
    );
  }
}
