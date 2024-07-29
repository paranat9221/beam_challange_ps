import 'package:beam_challange_ps/model/payment_argument_model.dart';
import 'package:beam_challange_ps/model/payment_status_argument_model.dart';
import 'package:beam_challange_ps/presentations/payment/bloc/payment_bloc.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_argument_view_model.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_view_model.dart';
import 'package:beam_challange_ps/presentations/payment/widgets/payment_processing.dart';
import 'package:beam_challange_ps/presentations/payment/widgets/payment_qr.dart';
import 'package:beam_challange_ps/presentations/payment/widgets/payment_success.dart';
import 'package:beam_challange_ps/repositories/payment_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.args}) : super(key: key);

  final PaymentArgumentViewModel args;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final PaymentBloc _paymentBloc;
  late final PaymentRepository _paymentRepository;

  @override
  void initState() {
    _paymentBloc = PaymentBloc();
    _paymentRepository = PaymentRepository();

    _paymentRepository
        .init(
            arg: PaymentArgsModel(
                shopId: 'shopId',
                price: widget.args.price,
                note: widget.args.note))
        .then((paymentQr) {
      _paymentBloc.add(PaymentQrInitiated(
        id: paymentQr.id,
        qr: paymentQr.qr,
        price: widget.args.price,
      ));

      qrScanListener(paymentQr.id);
    });

    super.initState();
  }

  @override
  void dispose() {
    _paymentBloc.close();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  void qrScanListener(String id) async {
    //...do some process to get status

    PaymentStatus status = PaymentStatus.created;

    while ((status != PaymentStatus.done) && (status != PaymentStatus.error)) {
      PaymentStatus result = await _paymentRepository.getStatus(
        arg: PaymentStatusArgsModel(id: id, currentStatus: status),
      );

      if (status != result) {
        _paymentBloc.add(PaymentUpdateStatus(status: result));
      }

      status = result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _paymentBloc,
      builder: (context, state) {
        switch (state) {
          case PaymentInitiateState():
            return Scaffold(
              appBar: AppBar(),
              body: const Center(child: CircularProgressIndicator()),
            );
          case PaymentQrState():
            return PaymentQr(state.model);
          case PaymentProcessingState():
            return const PaymentProcessing();
          case PaymentSuccessState():
            return PaymentSuccess(
              model: PaymentSuccessViewModel(price: widget.args.price),
            );
          default:
            return Container();
        }
      },
    );
  }
}
