import 'package:beam_challange_ps/presentations/common/view_model/account_view_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(const AccountInitialState()) {
    on<AccountUpdate>(_onAccountUpdate);
  }

  void _onAccountUpdate(AccountUpdate event, Emitter<AccountState> emit) {
    emit(AccountMainState(event.account));
  }
}
