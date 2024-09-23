import 'package:dartz/dartz.dart';
import 'package:hostel/data/rooms_availability/models/block_model.dart';
import 'package:hostel/data/rooms_availability/models/room_model.dart';
import 'package:hostel/data/rooms_availability/source/rooms_availability_firebase_service.dart';
import 'package:hostel/domain/rooms_availability/repository/rooms_availability_repository.dart';
import 'package:hostel/service_locator.dart';

class RoomsAvailabilityRepositoryImpl extends RoomsAvailabilityRepository {
  @override
  Future<Either> getBlocks() async {
    var returnedData = await sl<RoomsAvailabilityFirebaseService>().getBlocks();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map(
            (e) => BlockModel.fromMap(e).toEntity(),
          )
          .toList());
    });
  }

  @override
  Future<Either> getRooms() async {
    var returnedData = await sl<RoomsAvailabilityFirebaseService>().getRooms();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map(
            (e) => RoomModel.fromMap(e).toEntity(),
          )
          .toList());
    });
  }

  @override
  Future<Either> getRoomsByBlock(String blockId) async {
    var returnedData =
        await sl<RoomsAvailabilityFirebaseService>().getRoomsByBlock(blockId);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map(
            (e) => RoomModel.fromMap(e).toEntity(),
          )
          .toList());
    });
  }
}
