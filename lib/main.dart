import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hostel/common/bloc/button/button_bloc.dart';
import 'package:hostel/firebase_options.dart';
import 'package:hostel/presentation/auth/pages/signin_page.dart';
import 'package:hostel/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SigninPage(),
      ),
    );
  }
}
