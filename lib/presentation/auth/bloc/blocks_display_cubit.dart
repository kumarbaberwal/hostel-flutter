import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/domain/auth/usecases/get_block_names_use_case.dart';
import 'package:hostel/presentation/auth/bloc/blocks_display_state.dart';
import 'package:hostel/service_locator.dart';

class BlocksDisplayCubit extends Cubit<BlocksDisplayState> {
  BlocksDisplayCubit() : super(BlocksLoading());

  void displayBlocks() async {
    var returnedData = await sl<GetBlockNamesUseCase>().call();

    returnedData.fold((errorMessage) {
      emit(BlocksLoadFailure(errorMessage: errorMessage));
    }, (data) {
      emit(BlocksLoaded(blocks: data));
    });
  }
}
