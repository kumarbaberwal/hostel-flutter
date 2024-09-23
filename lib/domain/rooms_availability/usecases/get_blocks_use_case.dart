import 'package:dartz/dartz.dart';
import 'package:hostel/core/usecases/usecase.dart';
import 'package:hostel/domain/rooms_availability/repository/rooms_availability_repository.dart';
import 'package:hostel/service_locator.dart';

class GetBlocksUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<RoomsAvailabilityRepository>().getBlocks();
  }
}
