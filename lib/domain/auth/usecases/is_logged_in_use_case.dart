import 'package:hostel/core/usecases/usecase.dart';
import 'package:hostel/domain/auth/repository/auth_repository.dart';
import 'package:hostel/service_locator.dart';

class IsLoggedInUseCase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }
}
