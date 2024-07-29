import 'package:beam_challange_ps/model/payment_argument_model.dart';
import 'package:beam_challange_ps/model/payment_status_argument_model.dart';
import 'package:http/http.dart' as http;

class PaymentApi {
  PaymentApi();

  Future<http.Response> getQrCode({required PaymentArgsModel arg}) async {
    //Do Fetching Qr Code

    await Future.delayed(const Duration(seconds: 3));

    return http.Response('{"id": "123", "qr": "1234567890"}', 200); //mocking
  }

  Future<http.Response> getStatus({required PaymentStatusArgsModel arg}) async {
    //Do Fetching Status

    await Future.delayed(const Duration(seconds: 3));

    //Mock
    late String result;

    if (arg.currentStatus == PaymentStatus.created) {
      result = "processing";
    } else if (arg.currentStatus == PaymentStatus.processing) {
      result = "done";
    } else {
      result = "";
    }

    return http.Response(result, 200); //mocking
  }
}
