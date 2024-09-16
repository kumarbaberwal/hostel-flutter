import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either> getBlocks();
  Future<Either> getRooms(String blockId);
  // Future<Either> signin(UserSigninRequest userSigninRequest);
  Future<bool> isLoggedIn();
}
