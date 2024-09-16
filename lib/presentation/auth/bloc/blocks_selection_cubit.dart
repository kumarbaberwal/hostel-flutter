import 'package:flutter_bloc/flutter_bloc.dart';

class BlocksSelectionCubit extends Cubit<String> {
  BlocksSelectionCubit() : super('Select Block');
  String selectedBlock = '';

  void selectBlock(String block) {
    selectedBlock = block;
    emit(block);
  }
}
