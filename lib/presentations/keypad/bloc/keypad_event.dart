part of 'keypad_bloc.dart';

@immutable
sealed class KeypadEvent {
  const KeypadEvent();
}

final class KeypadAddEvent extends KeypadEvent {
  const KeypadAddEvent(this.value);

  final int? value;
}

final class KeypadDotEvent extends KeypadEvent {
  const KeypadDotEvent();
}

final class KeypadDelEvent extends KeypadEvent {
  const KeypadDelEvent();
}

final class KeypadAddNoteEvent extends KeypadEvent {
  const KeypadAddNoteEvent(this.note);

  final String note;
}
