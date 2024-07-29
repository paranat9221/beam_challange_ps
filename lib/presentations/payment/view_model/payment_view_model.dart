class PaymentQrViewModel {
  const PaymentQrViewModel({
    required this.id,
    required this.qr,
    required this.price,
  });

  final String id;
  final String qr;
  final double price;
}

class PaymentSuccessViewModel {
  const PaymentSuccessViewModel({
    required this.price,
  });

  final double price;
}
