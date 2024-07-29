import 'dart:convert';

import 'package:beam_challange_ps/model/account_model.dart';
import 'package:beam_challange_ps/model/sign_in_argument_model.dart';
import 'package:beam_challange_ps/networks/api/sign_in_api.dart';
import 'package:beam_challange_ps/presentations/common/view_model/account_view_model.dart';
import 'package:beam_challange_ps/presentations/common/view_model/shop_view_model.dart';
import 'package:http/http.dart';

class SignInRepository {
  final SignInApi api;

  SignInRepository() : api = SignInApi();

  Future<AccountViewModel> signIn({required SignInArgsModel args}) async {
    final Response response = await api.signIn(args: args);

    final AccountModel account =
        AccountModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return AccountViewModel(
        email: account.email,
        imageUrl: account.imageUrl,
        shop: ShopViewModel(
          name: account.shopName,
          imageUrl: account.shopImageUrl,
        ),
      );
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
