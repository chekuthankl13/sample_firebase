import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_firebase/core/error/exceptions.dart';
import 'package:sample_firebase/core/error/failure.dart';

abstract interface class AuthRemoteDatasorce {
  Future<String> login({email, password});
  Future<String> register({email, password});
}

class AuthRemoteDatasorceImpl extends AuthRemoteDatasorce {
  final FirebaseAuth auth;

  AuthRemoteDatasorceImpl({required this.auth});
  @override
  Future<String> login({email, password}) async {
    try {
      UserCredential userCred = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCred.user!.uid;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw AuthenticationFailure(error: 'No user found for that email.');
        case 'wrong-password':
          throw AuthenticationFailure(
              error: 'Wrong password provided for that user.');

        default:
          throw AuthenticationFailure(error: e.code);
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<String> register({email, password}) async {
    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user!.uid;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw AuthenticationFailure(
              error: "'The password provided is too weak.'");
        case 'email-already-in-use':
          throw AuthenticationFailure(
              error: 'The account already exists for that email.');

        default:
          throw AuthenticationFailure(error: e.code);
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
