import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/presentation/auth/bloc/rooms_display_cubit.dart';
import 'package:hostel/presentation/auth/bloc/rooms_display_state.dart';
import 'package:hostel/presentation/auth/bloc/rooms_selection_cubit.dart';

class RoomNumbers extends StatelessWidget {
  const RoomNumbers({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 2.7,
      child: BlocBuilder<RoomsDisplayCubit, RoomsDisplayState>(
        builder: (context, state) {
          if (state is RoomsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is RoomsLoaded) {
            return _rooms(state.rooms);
          } else if (state is RoomsLoadFailure) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _rooms(List<QueryDocumentSnapshot<Map<String, dynamic>>> roomNumbers) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pop(context);

            context.read<RoomsSelectionCubit>().selectRoom(
                  roomNumbers[index].data()['roomNumber'],
                );
          },
          child: Text(
            roomNumbers[index].data()['roomNumber'].toString(),
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
      itemCount: roomNumbers.length,
    );
  }
}
