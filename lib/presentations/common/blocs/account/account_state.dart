part of 'account_bloc.dart';

sealed class AccountState extends Equatable {
  const AccountState();

  @override
  List<Object> get props => [];
}

final class AccountInitialState extends AccountState {
  const AccountInitialState();
}

final class AccountMainState extends AccountState {
  const AccountMainState(this.account);

  final AccountViewModel account;

  @override
  List<Object> get props => [account];
}
