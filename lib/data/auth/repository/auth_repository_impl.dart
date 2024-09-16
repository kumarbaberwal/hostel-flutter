import 'package:dartz/dartz.dart';
import 'package:hostel/data/auth/source/auth_firebase_service.dart';
import 'package:hostel/domain/auth/repository/auth_repository.dart';
import 'package:hostel/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> getBlocks() async {
    return await sl<AuthFirebaseService>().getBlocks();
  }

  @override
  Future<Either> getRooms(String blockId) async {
    return await sl<AuthFirebaseService>().getRooms(blockId);
  }

  // @override
  // Future<void> signin(UserSigninRequest userSigninRequest) async {
  //   return await sl<AuthFirebaseService>().signin(userSigninRequest);
  // }

  @override
  Future<bool> isLoggedIn() async {
    return sl<AuthFirebaseService>().isLoggedIn();
  }
}
