import 'package:hostel/domain/rooms_availability/entity/room_entity.dart';

abstract class RoomsDisplayState {}

class RoomsLoaded extends RoomsDisplayState {
  final List<RoomEntity> rooms;

  RoomsLoaded({required this.rooms});
}

class RoomsLoadFailure extends RoomsDisplayState {
  final String errorMessage;

  RoomsLoadFailure({required this.errorMessage});
}

class RoomsLoading extends RoomsDisplayState {}
