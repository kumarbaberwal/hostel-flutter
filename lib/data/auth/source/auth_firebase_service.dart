import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseService {
  Future<Either> getBlocks();
  Future<Either> getRooms(String blockId);
  Future<bool> isLoggedIn();
  // Future<Either> signin(UserSigninRequest userSigninRequest);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<Either> getBlocks() async {
    try {
      var returnedData =
          await FirebaseFirestore.instance.collection('Blocks').get();
      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Please Try Again');
    }
  }

  @override
  Future<Either> getRooms(String blockId) async {
    try {
      var returnedData = await FirebaseFirestore.instance
          .collection('Rooms')
          .where('blockId', isEqualTo: blockId)
          .where('roomStatus', isEqualTo: 'Available')
          .get();

      return Right(returnedData.docs);
    } catch (e) {
      return const Left('Please Try Again');
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  // @override
  // Future<Either> signin(UserSigninRequest userSigninRequest) async {
  //   try {
  //     await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: userSigninRequest.emailAddress,
  //       password: userSigninRequest.password,
  //     );
  //     return;
  //   } on FirebaseAuthException catch (e) {
  //     String message;
  //     if (e.code == 'invalid-email') {
  //       message = 'User not found for that email';
  //     } else if (e.code == 'invalid-credential') {
  //       message = 'Wrong Password provided for that user';
  //     } else {
  //       message = 'An unknown error occurred';
  //     }
  //     // Throwing the error to be caught by the caller
  //     throw Exception(message);
  //   }
  // }
}
