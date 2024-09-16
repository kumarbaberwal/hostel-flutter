import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BlocksDisplayState {}

class BlocksLoaded extends BlocksDisplayState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> blocks;

  BlocksLoaded({required this.blocks});
}

class BlocksLoadFailure extends BlocksDisplayState {
  final String errorMessage;

  BlocksLoadFailure({required this.errorMessage});
}

class BlocksLoading extends BlocksDisplayState {}
