import 'package:flutter_bloc/flutter_bloc.dart';

class RoomsSelectionCubit extends Cubit<dynamic> {
  RoomsSelectionCubit() : super('Select Rooms');

  int? selectedRoom;

  void selectRoom(int roomNumber) {
    selectedRoom = roomNumber;
    emit(roomNumber);
  }
}
