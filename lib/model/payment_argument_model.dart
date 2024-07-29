class PaymentArgsModel {
  const PaymentArgsModel({
    required this.shopId,
    required this.price,
    this.note,
  });

  final String shopId;
  final double price;
  final String? note;
}
