import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/domain/rooms_availability/usecases/get_blocks_use_case.dart';
import 'package:hostel/presentation/auth/bloc/blocks_display_state.dart';
import 'package:hostel/service_locator.dart';

class BlocksDisplayCubit extends Cubit<BlocksDisplayState> {
  BlocksDisplayCubit() : super(BlocksLoading());

  void displayBlocks() async {
    var returnedData = await sl<GetBlocksUseCase>().call();

    returnedData.fold((errorMessage) {
      emit(BlocksLoadFailure(errorMessage: errorMessage));
    }, (data) {
      emit(BlocksLoaded(blocks: data));
    });
  }
}
