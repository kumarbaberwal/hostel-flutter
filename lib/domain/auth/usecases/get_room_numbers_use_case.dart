import 'package:dartz/dartz.dart';
import 'package:hostel/core/usecases/usecase.dart';
import 'package:hostel/domain/auth/repository/auth_repository.dart';
import 'package:hostel/service_locator.dart';

class GetRoomNumbersUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<AuthRepository>().getRooms(params!);
  }
}
