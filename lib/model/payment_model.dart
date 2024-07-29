class PaymentModel {
  const PaymentModel({
    required this.id,
    required this.qr,
  });

  final String id;
  final String qr;

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as String,
      qr: json['qr'] as String,
    );
  }
}
