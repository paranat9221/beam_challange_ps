enum AppStringKeys {
  //sign in screen
  signInTitle("signInTitle"),
  signInInputEmail("signInInputEmail"),
  signInInputEmailErrEmpty("signInInputEmailErrEmpty"),
  signInInputEmailErrInvalid("signInInputEmailErrInvalid"),
  signInInputPassword("signInInputPassword"),
  signInInputPasswordErrEmpty("signInInputPasswordErrEmpty"),
  signInSubmitBtn("signInSubmitBtn"),
  signInSubmitPopupInvalidTitle("signInSubmitPopupInvalidTitle"),
  signInSubmitPopupInvalidDesc("signInSubmitPopupInvalidDesc"),
  signInSubmitPopupInvalidBtn("signInSubmitPopupInvalidBtn"),

  //keypad
  keypadChargeBtn("keypadChargeBtn"),
  keypadNoteBtn("keypadNoteBtn"),
  keypadNoteSaveBtn("keypadNoteSaveBtn"),
  keypadNoteTitle("keypadNoteTitle"),
  keypadNoteBoxTitle("keypadNoteBoxTitle"),
  keypadNoteDesc("keypadNoteDesc"),

  //payment
  paymentPay("paymentPay"),
  paymentAppBarTitle("paymentTitle"),
  paymentProcessingTitle("paymentProcessingTitle"),
  paymentProcessingDesc("paymentProcessingDesc"),
  paymentSuccessTitle("paymentSuccessTitle"),
  paymentSuccessPaid("paymentSuccessPay"),
  paymentSuccessNewPaymentBtn("paymentSuccessNewPaymentBtn"),

  //main
  appName("appName");

  const AppStringKeys(this.key);
  final String key;
}
