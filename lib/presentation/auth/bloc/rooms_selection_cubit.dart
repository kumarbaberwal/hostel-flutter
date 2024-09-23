import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsSelectionCubit extends Cubit<String> {
  String selectedRoom = '';

  RoomsSelectionCubit() : super('Select Rooms');

  void selectRoom(String roomNumber) {
    selectedRoom = roomNumber;
    emit(roomNumber);
  }
}
