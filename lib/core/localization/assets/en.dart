import 'package:beam_challange_ps/core/localization/assets/string_key.dart';

const Map<AppStringKeys, String> i18nEn = {
  //sign in screen
  AppStringKeys.signInTitle: "Sign in",
  AppStringKeys.signInInputEmail: "Email address",
  AppStringKeys.signInInputEmailErrEmpty: "Please fill in this field.",
  AppStringKeys.signInInputEmailErrInvalid:
      "Invalid email address. Please try again.",
  AppStringKeys.signInInputPassword: "Password",
  AppStringKeys.signInInputPasswordErrEmpty: "Please fill in this field.",
  AppStringKeys.signInSubmitBtn: "Sign In",
  AppStringKeys.signInSubmitPopupInvalidTitle: "Couldn’t sign you in",
  AppStringKeys.signInSubmitPopupInvalidDesc:
      "Your email address or password doesn’t look right. Please try again.",
  AppStringKeys.signInSubmitPopupInvalidBtn: "OK",

  //keypad
  AppStringKeys.keypadChargeBtn: "Charge",
  AppStringKeys.keypadNoteBtn: "Note",
  AppStringKeys.keypadNoteSaveBtn: "Save",
  AppStringKeys.keypadNoteTitle: "Add internal note",
  AppStringKeys.keypadNoteBoxTitle: "note",
  AppStringKeys.keypadNoteDesc:
      "This note is only visible to you and your team.",

  //payment
  AppStringKeys.paymentPay: "Pay",
  AppStringKeys.paymentAppBarTitle: "Scan to Pay",
  AppStringKeys.paymentProcessingTitle: "Payment processing...",
  AppStringKeys.paymentProcessingDesc:
      "Please do not refresh or close this page. Thanks for being awesome and patient.",
  AppStringKeys.paymentSuccessTitle: "Payment successful!",
  AppStringKeys.paymentSuccessPaid: "Paid",
  AppStringKeys.paymentSuccessNewPaymentBtn: "Charge New Payment",
};
