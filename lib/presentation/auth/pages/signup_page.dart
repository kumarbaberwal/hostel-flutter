import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/common/bloc/button/button_cubit.dart';
import 'package:hostel/common/helper/bottomsheet/app_bottomsheet.dart';
import 'package:hostel/common/helper/navigator/app_navigator.dart';
import 'package:hostel/common/widgets/button/basic_app_button.dart';
import 'package:hostel/core/configs/theme/app_colors.dart';
import 'package:hostel/presentation/auth/bloc/blocks_display_cubit.dart';
import 'package:hostel/presentation/auth/bloc/blocks_selection_cubit.dart';
import 'package:hostel/presentation/auth/bloc/rooms_display_cubit.dart';
import 'package:hostel/presentation/auth/bloc/rooms_selection_cubit.dart';
import 'package:hostel/presentation/auth/widgets/block_names.dart';
import 'package:hostel/presentation/auth/widgets/room_numbers.dart';

class SignupPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
  String? block;
  String? roomNumber;
  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlocksSelectionCubit(),
          ),
          BlocProvider(
            create: (context) => BlocksDisplayCubit(),
          ),
          BlocProvider(
            create: (context) => RoomsSelectionCubit(),
          ),
          BlocProvider(
            create: (context) => RoomsDisplayCubit(),
          ),
          BlocProvider(
            create: (context) => ButtonCubit(),
          ),
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _signupText(),
                  const SizedBox(
                    height: 20,
                  ),
                  userNameField(),
                  const SizedBox(
                    height: 20,
                  ),
                  firstNameField(),
                  const SizedBox(
                    height: 20,
                  ),
                  lastNameField(),
                  const SizedBox(
                    height: 20,
                  ),
                  emailField(),
                  const SizedBox(
                    height: 20,
                  ),
                  passwordField(),
                  const SizedBox(
                    height: 20,
                  ),
                  phoneNumberField(),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectBlock(),
                  const SizedBox(
                    height: 20,
                  ),
                  _selectRoom(),
                  const SizedBox(
                    height: 20,
                  ),
                  _finishButton(context),
                  const SizedBox(
                    height: 20,
                  ),
                  signIn(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextFormField emailField() {
    return TextFormField(
      controller: email,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter Email',
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Email is required";
        } else if (!gmailRegex.hasMatch(value.trim())) {
          return "Email is Not Valid";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField firstNameField() {
    return TextFormField(
      controller: firstName,
      decoration: InputDecoration(
        hintText: 'Enter Firstname',
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Firstname is required";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField lastNameField() {
    return TextFormField(
      controller: lastName,
      decoration: InputDecoration(
        hintText: 'Enter Lastname',
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Lastname is required";
        } else {
          return null;
        }
      },
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      controller: password,
      decoration: InputDecoration(
        hintText: 'Enter Password',
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      obscureText: true,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return 'Please enter your password';
        } else if (value.trim().length < 6) {
          return 'Password must be at least 6 characters long';
        }
        return null;
      },
    );
  }

  TextFormField phoneNumberField() {
    return TextFormField(
      controller: phoneNumber,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: 'Enter Phone Number',
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Phone Number is required";
        } else if (value.trim().length < 10) {
          return "Phone Number must be 10 digits";
        } else if (value.trim().length > 10) {
          return "Phone Number must be 10 digits";
        } else {
          return null;
        }
      },
    );
  }

  RichText signIn(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
              text: "Do you have an account? ",
              style: TextStyle(
                color: Colors.black,
              )),
          TextSpan(
            text: "Signin",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                AppNavigator.pushAndRemoveUntil(context, SignupPage());
              },
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  TextFormField userNameField() {
    return TextFormField(
      controller: userName,
      decoration: InputDecoration(
        hintText: 'Enter Username',
        hintStyle: const TextStyle(color: AppColors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.green,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.green),
        ),
      ),
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "Username is required";
        } else {
          return null;
        }
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return Center(
      child: Builder(builder: (context) {
        return BasicAppButton(
            onPressed: () {
              // userCreationRequest.gender =
              //     context.read<GenderSelectionCubit>().selectedIndex;
              // userCreationRequest.age =
              //     context.read<AgeSelectionCubit>().selectedAge;
              // context.read<ButtonCubit>().execute(
              //     usecase: SignupUseCase(), params: userCreationRequest);
            },
            title: 'Finish');
      }),
    );
  }

  Widget _selectBlock() {
    return BlocBuilder<BlocksSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomsheet.display(
                context,
                MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                        value: context.read<BlocksSelectionCubit>()),
                    BlocProvider.value(
                        value: context.read<BlocksDisplayCubit>()
                          ..displayBlocks()),
                  ],
                  child: const BlockNames(),
                ));
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _selectRoom() {
    return BlocBuilder<RoomsSelectionCubit, dynamic>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomsheet.display(
                context,
                MultiBlocProvider(
                  providers: [
                    BlocProvider.value(
                        value: context.read<RoomsSelectionCubit>()),
                    BlocProvider.value(
                      value: context.read<RoomsDisplayCubit>()
                        ..displayRooms(
                          context.read<BlocksSelectionCubit>().selectedBlock,
                        ),
                    ),
                  ],
                  child: const RoomNumbers(),
                ));
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(16)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(state),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }

  Text _signupText() {
    return const Text(
      'Create Account',
      style: TextStyle(
        fontSize: 42,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
