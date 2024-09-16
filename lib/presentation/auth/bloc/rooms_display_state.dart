import 'package:cloud_firestore/cloud_firestore.dart';

abstract class RoomsDisplayState {}

class RoomsLoaded extends RoomsDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> rooms;

  RoomsLoaded({required this.rooms});
}

class RoomsLoadFailure extends RoomsDisplayState {
  final String errorMessage;

  RoomsLoadFailure({required this.errorMessage});
}

class RoomsLoading extends RoomsDisplayState {}
