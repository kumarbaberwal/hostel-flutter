import 'package:hostel/domain/rooms_availability/entity/block_entity.dart';

abstract class BlocksDisplayState {}

class BlocksLoaded extends BlocksDisplayState {
  final List<BlockEntity> blocks;

  BlocksLoaded({required this.blocks});
}

class BlocksLoadFailure extends BlocksDisplayState {
  final String errorMessage;

  BlocksLoadFailure({required this.errorMessage});
}

class BlocksLoading extends BlocksDisplayState {}
