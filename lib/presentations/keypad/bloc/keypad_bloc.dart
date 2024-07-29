import 'package:beam_challange_ps/core/utils/text_util.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'keypad_event.dart';
part 'keypad_state.dart';

class KeypadBloc extends Bloc<KeypadEvent, KeypadState> {
  KeypadBloc() : super(const KeypadMainState("")) {
    on<KeypadAddEvent>(_onKeypadAddEvent);
    on<KeypadDotEvent>(_onKeypadDotEvent);
    on<KeypadDelEvent>(_onKeypadDelEvent);
    on<KeypadAddNoteEvent>(_onKeypadAddNoteEvent);
  }

  void _onKeypadAddEvent(KeypadAddEvent event, Emitter<KeypadState> emit) {
    if (event.value is num) {
      final currentState = state as KeypadMainState;
      final int digits = countDigitsAfterDecimal(currentState.priceStr);

      if (currentState.isDone) {
        return;
      } else if (digits == 1 && currentState.isDigitsInput) {
        emit(KeypadMainState(
          "${currentState.priceStr}${event.value}",
          isDone: true,
          isDigitsInput: true,
        ));
      } else if (digits == 0 && currentState.isDigitsInput) {
        emit(KeypadMainState(
          "${currentState.priceStr.replaceAll(".", "")}.${event.value}",
          isDigitsInput: true,
        ));
      } else {
        emit(KeypadMainState("${currentState.priceStr}${event.value}"));
      }
    }
  }

  void _onKeypadDotEvent(KeypadDotEvent event, Emitter<KeypadState> emit) {
    final currentState = state as KeypadMainState;
    emit(KeypadMainState(
      currentState.priceStr,
      isDigitsInput: !currentState.isDigitsInput,
    ));
  }

  void _onKeypadDelEvent(KeypadDelEvent event, Emitter<KeypadState> emit) {
    final currentState = state as KeypadMainState;
    final int digits = countDigitsAfterDecimal(currentState.priceStr);

    if (digits == 2) {
      emit(KeypadMainState(
        currentState.priceStr.substring(0, currentState.priceStr.length - 1),
        isDigitsInput: true,
      ));
    } else if (digits == 1) {
      emit(KeypadMainState(
        currentState.priceStr.substring(0, currentState.priceStr.length - 2),
        isDigitsInput: true,
      ));
    } else if (currentState.priceStr.isNotEmpty) {
      emit(KeypadMainState(
        currentState.priceStr.substring(0, currentState.priceStr.length - 1),
      ));
    }
  }

  void _onKeypadAddNoteEvent(
      KeypadAddNoteEvent event, Emitter<KeypadState> emit) {
    final currentState = state as KeypadMainState;

    emit(KeypadMainState(
      currentState.priceStr,
      note: event.note,
    ));
  }
}
