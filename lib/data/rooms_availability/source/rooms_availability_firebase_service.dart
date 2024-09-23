import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

abstract class RoomsAvailabilityFirebaseService {
  Future<Either> getBlocks();
  Future<Either> getRooms();
  Future<Either> getRoomsByBlock(String blockId);
}

class RoomsAvailabilityFirebaseServiceImpl
    extends RoomsAvailabilityFirebaseService {
  @override
  Future<Either> getBlocks() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Blocks').get();
      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again');
    }
  }

  @override
  Future<Either> getRooms() async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Rooms')
          .where('roomStatus', isEqualTo: 'Available')
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again');
    }
  }

  @override
  Future<Either> getRoomsByBlock(String blockId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Rooms')
          .where('blockId', isEqualTo: blockId)
          .where('roomStatus', isEqualTo: 'Available')
          .get();

      return Right(returnedData.docs.map((e) => e.data()).toList());
    } catch (e) {
      return const Left('Please Try Again');
    }
  }
}
