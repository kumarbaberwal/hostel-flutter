import 'package:hostel/core/usecases/usecase.dart';
import 'package:hostel/data/auth/models/user_signin_request.dart';

class SigninUseCase implements Usecase<void, UserSigninRequest> {
  @override
  Future<void> call({UserSigninRequest? params}) async {
    // return await sl<AuthRepository>().signin(params!);
  }
}
