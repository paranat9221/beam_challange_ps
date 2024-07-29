class AccountModel {
  const AccountModel({
    required this.email,
    this.imageUrl,
    required this.shopName,
    this.shopImageUrl,
  });

  final String email;
  final String? imageUrl;
  final String shopName;
  final String? shopImageUrl;

  factory AccountModel.fromJson(Map<String, dynamic> json) {
    return AccountModel(
      email: json['email'],
      imageUrl: json['imageUrl'],
      shopName: json['shopName'],
      shopImageUrl: json['shopImageUrl'],
    );
  }
}
