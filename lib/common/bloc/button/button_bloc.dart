import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/common/bloc/button/button_event.dart';
import 'package:hostel/common/bloc/button/button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(ButtonInitialState()) {
    on<ButtonPressedEvent>(
      (event, emit) async {
        emit(ButtonLoadingState());
        try {
          final returnedData = await event.usecase.call(params: event.params);
          if (returnedData != null) {
            emit(ButtonSuccessState());
          } else {
            emit(ButtonFailureState(errorMessage: 'Unexpected Error Occured'));
          }
        } catch (e) {
          emit(ButtonFailureState(errorMessage: e.toString()));
        }
      },
    );
  }
}
