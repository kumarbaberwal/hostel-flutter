import 'package:get_it/get_it.dart';
import 'package:hostel/data/auth/repository/auth_repository_impl.dart';
import 'package:hostel/data/auth/source/auth_firebase_service.dart';
import 'package:hostel/domain/auth/repository/auth_repository.dart';
import 'package:hostel/domain/auth/usecases/get_block_names_use_case.dart';
import 'package:hostel/domain/auth/usecases/get_room_numbers_use_case.dart';
import 'package:hostel/domain/auth/usecases/is_logged_in_use_case.dart';
import 'package:hostel/domain/auth/usecases/signin_use_case.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // services

  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  // repository

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecases

  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  sl.registerSingleton<GetBlockNamesUseCase>(GetBlockNamesUseCase());
  sl.registerSingleton<GetRoomNumbersUseCase>(GetRoomNumbersUseCase());
}
