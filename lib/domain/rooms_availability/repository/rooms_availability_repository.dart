import 'package:dartz/dartz.dart';

abstract class RoomsAvailabilityRepository {
  Future<Either> getBlocks();
  Future<Either> getRooms();
  Future<Either> getRoomsByBlock(String blockId);
}
