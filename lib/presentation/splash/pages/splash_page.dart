import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/common/helper/navigator/app_navigator.dart';
import 'package:hostel/core/configs/assets/app_vectors.dart';
import 'package:hostel/core/configs/theme/app_colors.dart';
import 'package:hostel/presentation/auth/pages/signup_page.dart';
import 'package:hostel/presentation/home/pages/home_page.dart';
import 'package:hostel/presentation/splash/bloc/splash_cubit.dart';
import 'package:hostel/presentation/splash/bloc/splash_state.dart';
import 'package:svg_flutter/svg.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacement(context, SignupPage());
        } else if (state is Authenticated) {
          AppNavigator.pushReplacement(context, const HomePage());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Center(
          child: SizedBox(
            height: 250,
            width: 250,
            child: SvgPicture.asset(AppVectors.hostelLogo),
          ),
        ),
      ),
    );
  }
}
