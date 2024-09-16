import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/presentation/auth/bloc/blocks_display_cubit.dart';
import 'package:hostel/presentation/auth/bloc/blocks_display_state.dart';
import 'package:hostel/presentation/auth/bloc/blocks_selection_cubit.dart';

class BlockNames extends StatelessWidget {
  const BlockNames({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.7,
      child: BlocBuilder<BlocksDisplayCubit, BlocksDisplayState>(
        builder: (context, state) {
          if (state is BlocksLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BlocksLoaded) {
            return _blocks(state.blocks);
          } else if (state is BlocksLoadFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _blocks(List<QueryDocumentSnapshot<Map<String, dynamic>>> blockNames) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);

            context.read<BlocksSelectionCubit>().selectBlock(
                  blockNames[index].data()['blockName'],
                );
          },
          child: Text(
            blockNames[index].data()['blockName'],
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: blockNames.length,
    );
  }
}
