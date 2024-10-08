import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/domain/rooms_availability/usecases/get_rooms_by_block_use_case.dart';
import 'package:hostel/presentation/auth/bloc/rooms_display_state.dart';
import 'package:hostel/service_locator.dart';

class RoomsDisplayCubit extends Cubit<RoomsDisplayState> {
  RoomsDisplayCubit() : super(RoomsLoading());

  void displayRooms(String blockId) async {
    var returnedData = await sl<GetRoomsByBlockUseCase>().call(params: blockId);

    returnedData.fold((errorMessage) {
      emit(RoomsLoadFailure(errorMessage: errorMessage));
    }, (data) {
      emit(RoomsLoaded(rooms: data));
    });
  }
}
