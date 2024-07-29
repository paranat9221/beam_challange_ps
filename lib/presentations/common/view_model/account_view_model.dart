import 'package:beam_challange_ps/presentations/common/view_model/shop_view_model.dart';

class AccountViewModel {
  AccountViewModel({
    required this.email,
    this.imageUrl,
    required this.shop,
  });

  String email;
  String? imageUrl;
  ShopViewModel shop;
}
