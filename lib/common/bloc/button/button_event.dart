import 'package:hostel/core/usecases/usecase.dart';

abstract class ButtonEvent {}

class ButtonPressedEvent extends ButtonEvent {
  final Usecase usecase;
  final dynamic params;

  ButtonPressedEvent({required this.usecase, required this.params});
}
