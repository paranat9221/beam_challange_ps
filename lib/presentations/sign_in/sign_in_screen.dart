import 'package:beam_challange_ps/core/localization/assets/string_key.dart';
import 'package:beam_challange_ps/core/res/app_spacings.dart';
import 'package:beam_challange_ps/core/styles/app_text_styles.dart';
import 'package:beam_challange_ps/core/utils/text_util.dart';
import 'package:beam_challange_ps/model/sign_in_argument_model.dart';
import 'package:beam_challange_ps/presentations/app_routes.dart';
import 'package:beam_challange_ps/presentations/common/blocs/account/account_bloc.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_button.dart';
import 'package:beam_challange_ps/presentations/common/widgets/app_string.dart';
import 'package:beam_challange_ps/presentations/common/widgets/gap.dart';
import 'package:beam_challange_ps/presentations/sign_in/view_model/sign_in_view_model.dart';
import 'package:beam_challange_ps/presentations/sign_in/widgets/sign_in_invalid_dialog.dart';
import 'package:beam_challange_ps/presentations/sign_in/widgets/text_input.dart';
import 'package:beam_challange_ps/repositories/sign_in_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailInputController;
  late final TextEditingController passwordInputController;
  late SignInViewModel model;
  late final SignInRepository _signInRepository;
  bool isLoading = false;

  @override
  void initState() {
    emailInputController = TextEditingController();
    passwordInputController = TextEditingController();
    _signInRepository = SignInRepository();
    model = SignInViewModel();
    super.initState();
  }

  @override
  void dispose() {
    emailInputController.dispose();
    passwordInputController.dispose();
    super.dispose();
  }

  void validateEmail() {
    setState(() {
      if (emailInputController.text.isEmpty) {
        model.isEmailValidated = false;
        model.emailInputErr = EmailInputErr.empty;
      } else if (!isValidEmail(emailInputController.text)) {
        model.isEmailValidated = false;
        model.emailInputErr = EmailInputErr.invalid;
      } else {
        model.isEmailValidated = true;
        model.emailInputErr = null;
      }
    });
  }

  void validatePassword() {
    setState(() {
      if (passwordInputController.text.isEmpty) {
        model.isPasswordValidated = false;
        model.passwordInputErr = PasswordInputErr.empty;
      } else {
        model.isPasswordValidated = true;
        model.passwordInputErr = null;
      }
    });
  }

  void onSubmit() async {
    if (model.isEmailValidated && model.isPasswordValidated) {
      setState(() {
        isLoading = true;
      });

      await _signInRepository
          .signIn(
        args: SignInArgsModel(
          email: emailInputController.text,
          password: passwordInputController.text,
        ),
      )
          .then(
        (account) {
          BlocProvider.of<AccountBloc>(context)
              .add(AccountUpdate(account: account));

          Navigator.of(context).pushReplacementNamed(AppRoutes.homeScreen);
        },
      );

      setState(() {
        isLoading = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const SignInInvalidDialog();
        },
        barrierDismissible: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: ListView(
            children: [
              const Gap(AppSpacing.sectionXl),
              Text(
                appString(AppStringKeys.signInTitle),
                style: AppTextStyles.heading.xl.regular,
              ),
              const Gap(AppSpacing.sectionXl),
              SignInTextInput(
                title: appString(AppStringKeys.signInInputEmail),
                controller: emailInputController,
                textInputAction: TextInputAction.next,
                onEditingComplete: validateEmail,
                errorMessage: appString(
                  model.emailInputErr?.errStringKey,
                ),
              ),
              const Gap(AppSpacing.sectionMd),
              SignInTextInput(
                title: appString(AppStringKeys.signInInputPassword),
                controller: passwordInputController,
                onEditingComplete: validatePassword,
                errorMessage: appString(
                  model.passwordInputErr?.errStringKey,
                ),
                isPassword: true,
              ),
              const Gap(AppSpacing.sectionXl),
              AppButton.full(
                title: appString(AppStringKeys.signInSubmitBtn),
                onTap: onSubmit,
                isLoading: isLoading,
              ),
              const Gap(AppSpacing.sectionXl),
            ],
          ),
        ),
      ),
    );
  }
}
