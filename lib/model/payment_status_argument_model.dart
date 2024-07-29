class PaymentStatusArgsModel {
  const PaymentStatusArgsModel({
    required this.id,
    required this.currentStatus,
  });

  final String id;
  final PaymentStatus currentStatus; //use for mocking only
}

enum PaymentStatus { created, processing, done, error }
