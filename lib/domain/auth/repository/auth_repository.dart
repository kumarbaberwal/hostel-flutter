import 'package:hostel/data/auth/models/user_signin_request.dart';

abstract class AuthRepository {
  Future<void> signin(UserSigninRequest userSigninRequest);
}
