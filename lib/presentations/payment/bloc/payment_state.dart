part of 'payment_bloc.dart';

sealed class PaymentState extends Equatable {
  const PaymentState();

  @override
  List<Object> get props => [];
}

final class PaymentInitiateState extends PaymentState {
  const PaymentInitiateState();
}

final class PaymentQrState extends PaymentState {
  const PaymentQrState(this.model);

  final PaymentQrViewModel model;
}

final class PaymentProcessingState extends PaymentState {
  const PaymentProcessingState();
}

final class PaymentSuccessState extends PaymentState {
  const PaymentSuccessState();
}
