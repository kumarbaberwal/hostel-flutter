// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hostel/common/bloc/button/button_bloc.dart';
// import 'package:hostel/common/bloc/button/button_cubit.dart';
// import 'package:hostel/common/bloc/button/button_event.dart';
// import 'package:hostel/common/bloc/button/button_state.dart';
// import 'package:hostel/common/helper/navigator/app_navigator.dart';
// import 'package:hostel/common/widgets/button/basic_app_button.dart';
// import 'package:hostel/core/configs/theme/app_colors.dart';
// import 'package:hostel/data/auth/models/user_signin_request.dart';
// import 'package:hostel/domain/auth/usecases/signin_use_case.dart';
// import 'package:hostel/presentation/auth/pages/signup_page.dart';
// import 'package:hostel/presentation/auth/widgets/hostel_logo.dart';
// import 'package:hostel/presentation/home/pages/home_page.dart';

// class SigninPage extends StatefulWidget {
//   final UserSigninRequest userSigninRequest;
//   const SigninPage({
//     super.key,
//     required this.userSigninRequest,
//   });

//   @override
//   State<SigninPage> createState() => _SigninPageState();
// }

// class _SigninPageState extends State<SigninPage> {
//   final TextEditingController _emailController = TextEditingController();

//   final TextEditingController _passwordController = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   final gmailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: BlocProvider(
//             create: (context) => ButtonCubit(),
//             child: BlocListener<ButtonCubit, ButtonState>(
//               listener: (context, state) {
//                 if (state is ButtonFailureState) {
//                   var snackBar = SnackBar(
//                     content: Text(state.errorMessage),
//                     behavior: SnackBarBehavior.floating,
//                   );
//                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                 } else if (state is ButtonSuccessState) {
//                   AppNavigator.pushAndRemoveUntil(context, const HomePage());
//                 }
//               },
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 40,
//                     ),
//                     const HostelLogo(),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     signInText(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     emailField(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     passwordField(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     loginButton(),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     createAccount(context),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   RichText createAccount(BuildContext context) {
//     return RichText(
//       text: TextSpan(
//         children: [
//           const TextSpan(
//               text: "Don't you have an account? ",
//               style: TextStyle(
//                 color: Colors.black,
//               )),
//           TextSpan(
//             text: "Create One",
//             recognizer: TapGestureRecognizer()
//               ..onTap = () {
//                 AppNavigator.push(context, SignupPage());
//               },
//             style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   TextFormField emailField() {
//     return TextFormField(
//       controller: _emailController,
//       decoration: InputDecoration(
//         hintText: 'Enter Email',
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(
//             color: Colors.green,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//       ),
//       validator: (value) {
//         if (value!.trim().isEmpty) {
//           return "Email is required";
//         } else if (!gmailRegex.hasMatch(value.trim())) {
//           return "Email is Not Valid";
//         } else {
//           return null;
//         }
//       },
//     );
//   }

//   Widget _finishButton(BuildContext context) {
//     return Container(
//       height: 100,
//       color: AppColors.primary,
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Center(
//         child: Builder(builder: (context) {
//           return BasicAppButton(
//               onPressed: () {
//                 userCreationRequest.gender =
//                     context.read<GenderSelectionCubit>().selectedIndex;
//                 userCreationRequest.age =
//                     context.read<AgeSelectionCubit>().selectedAge;
//                 context.read<ButtonCubit>().execute(
//                     usecase: SignupUseCase(), params: userCreationRequest);
//               },
//               title: 'Signin');
//         }),
//       ),
//     );
//   }

//   TextFormField passwordField() {
//     return TextFormField(
//       controller: _passwordController,
//       decoration: InputDecoration(
//         hintText: 'Enter Password',
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(
//             color: Colors.green,
//           ),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(16),
//           borderSide: const BorderSide(color: Colors.green),
//         ),
//       ),
//       obscureText: true,
//       validator: (value) {
//         if (value!.trim().isEmpty) {
//           return 'Please enter your password';
//         } else if (value.trim().length < 6) {
//           return 'Password must be at least 6 characters long';
//         }
//         return null;
//       },
//     );
//   }

//   Text signInText() {
//     return const Text(
//       'Sign In',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 42),
//     );
//   }
// }
