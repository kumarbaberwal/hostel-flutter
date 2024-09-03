import 'package:hostel/data/auth/models/user_signin_request.dart';

abstract class AuthFirebaseService {
  Future<void> signin(UserSigninRequest userSigninRequest);
}


class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signin(UserSigninRequest userSigninRequest) async {
    
  }
}
