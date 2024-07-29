part of 'account_bloc.dart';

@immutable
sealed class AccountEvent {
  const AccountEvent();
}

final class AccountUpdate extends AccountEvent {
  const AccountUpdate({required this.account});

  final AccountViewModel account;
}
