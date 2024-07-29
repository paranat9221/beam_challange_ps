part of 'keypad_bloc.dart';

sealed class KeypadState extends Equatable {
  const KeypadState();

  @override
  List<Object> get props => [];
}

final class KeypadMainState extends KeypadState {
  const KeypadMainState(
    this.priceStr, {
    this.isDigitsInput = false,
    this.isDone = false,
    this.note,
  });
  final String priceStr;
  final bool isDigitsInput;
  final bool isDone;
  final String? note;

  @override
  List<Object> get props => [priceStr, isDigitsInput, isDone, note ?? ""];
}
