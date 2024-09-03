// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/common/bloc/button/button_bloc.dart';
import 'package:hostel/common/bloc/button/button_state.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? height;
  final double? width;
  const BasicAppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.content,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return loading(context);
        }
        return initial(context);
      },
    );
  }

  ElevatedButton initial(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child: content ??
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
    );
  }

  ElevatedButton loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 50,
        ),
      ),
      child: const SizedBox(
        height: 50,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
