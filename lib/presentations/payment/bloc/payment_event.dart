part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent {
  const PaymentEvent();
}

final class PaymentQrInitiated extends PaymentEvent {
  const PaymentQrInitiated({
    required this.id,
    required this.qr,
    required this.price,
  });

  final String id;
  final String qr;
  final double price;
}

final class PaymentUpdateStatus extends PaymentEvent {
  const PaymentUpdateStatus({required this.status});

  final PaymentStatus status;
}
