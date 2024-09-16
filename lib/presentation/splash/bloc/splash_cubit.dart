import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/domain/auth/usecases/is_logged_in_use_case.dart';
import 'package:hostel/presentation/splash/bloc/splash_state.dart';
import 'package:hostel/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 2));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
