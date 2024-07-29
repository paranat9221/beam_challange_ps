import 'package:beam_challange_ps/model/payment_status_argument_model.dart';
import 'package:beam_challange_ps/presentations/payment/view_model/payment_view_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentInitiateState()) {
    on<PaymentQrInitiated>(_onPaymentQrInitiated);
    on<PaymentUpdateStatus>(_opPaymentUpdateStatus);
  }

  void _onPaymentQrInitiated(
    PaymentQrInitiated event,
    Emitter<PaymentState> emit,
  ) {
    emit(
      PaymentQrState(
        PaymentQrViewModel(
          id: event.id,
          qr: event.qr,
          price: event.price,
        ),
      ),
    );
  }

  void _opPaymentUpdateStatus(
    PaymentUpdateStatus event,
    Emitter<PaymentState> emit,
  ) {
    switch (event.status) {
      case PaymentStatus.processing:
        emit(const PaymentProcessingState());
        break;
      case PaymentStatus.done:
        emit(const PaymentSuccessState());
        break;
      default:
        break;
    }
  }
}
