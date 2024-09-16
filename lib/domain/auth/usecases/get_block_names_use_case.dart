import 'package:dartz/dartz.dart';
import 'package:hostel/core/usecases/usecase.dart';
import 'package:hostel/domain/auth/repository/auth_repository.dart';
import 'package:hostel/service_locator.dart';

class GetBlockNamesUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRepository>().getBlocks();
  }
}
