import 'package:beam_challange_ps/model/sign_in_argument_model.dart';
import 'package:http/http.dart' as http;

class SignInApi {
  SignInApi();

  Future<http.Response> signIn({required SignInArgsModel args}) async {
    //mock result

    await Future.delayed(const Duration(seconds: 3));

    return http.Response(
        '{"email": "${args.email}", "shopName": "Paranat Studio"}', 200);
  }
}
