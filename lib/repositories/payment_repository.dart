import 'dart:convert';

import 'package:beam_challange_ps/model/payment_model.dart';
import 'package:beam_challange_ps/model/payment_status_argument_model.dart';
import 'package:beam_challange_ps/networks/api/payment_api.dart';
import 'package:beam_challange_ps/model/payment_argument_model.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_view_model.dart';
import 'package:http/http.dart';

class PaymentRepository {
  final PaymentApi api;

  PaymentRepository() : api = PaymentApi();

  Future<PaymentQrViewModel> init({required PaymentArgsModel arg}) async {
    final Response response = await api.getQrCode(arg: arg);

    final PaymentModel payment =
        PaymentModel.fromJson(jsonDecode(response.body));

    if (response.statusCode == 200) {
      return PaymentQrViewModel(
        id: payment.id,
        qr: payment.qr,
        price: arg.price,
      );
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  Future<PaymentStatus> getStatus({required PaymentStatusArgsModel arg}) async {
    final Response response = await api.getStatus(arg: arg);

    late final PaymentStatus status;

    switch (response.body) {
      case "processing":
        status = PaymentStatus.processing;
      case "done":
        status = PaymentStatus.done;
      default:
        status = PaymentStatus.created;
    }

    if (response.statusCode == 200) {
      return status;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
