import 'package:beam_challange_ps/core/localization/assets/string_key.dart';

class SignInViewModel {
  SignInViewModel({
    this.emailInputErr,
    this.passwordInputErr,
    this.isEmailValidated = false,
    this.isPasswordValidated = false,
  });

  EmailInputErr? emailInputErr;
  PasswordInputErr? passwordInputErr;
  bool isEmailValidated;
  bool isPasswordValidated;
}

enum EmailInputErr {
  empty(AppStringKeys.signInInputEmailErrEmpty),
  invalid(AppStringKeys.signInInputEmailErrInvalid);

  const EmailInputErr(this.errStringKey);
  final AppStringKeys errStringKey;
}

enum PasswordInputErr {
  empty(AppStringKeys.signInInputPasswordErrEmpty);

  const PasswordInputErr(this.errStringKey);
  final AppStringKeys errStringKey;
}
