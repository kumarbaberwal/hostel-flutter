class ButtonFailureState extends ButtonState {
  final String errorMessage;

  ButtonFailureState({required this.errorMessage});
}

class ButtonInitialState extends ButtonState {}

class ButtonLoadingState extends ButtonState {}

abstract class ButtonState {}

class ButtonSuccessState extends ButtonState {}
