import 'package:event_app_c16_sat/core/services/snackbar_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthService {
  static Future<bool> createAccount(
    String emailAddress,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );

      print(credential.user?.email ?? "");
      print(credential.user?.displayName ?? "");
      print(credential.user?.emailVerified ?? "");

      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        SnackBarService.showErrorMessage("The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        SnackBarService.showErrorMessage(
          "The account already exists for that email.",
        );
      }
      return Future.value(false);
    } catch (e) {
      print(e);
      return Future.value(false);
    }
  }

  static Future<bool> signIn(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SnackBarService.showErrorMessage('No user found for that email.');
      } else if (e.code == 'invalid-credential') {
        print('Wrong password provided for that user.');
        SnackBarService.showErrorMessage(
          'Wrong password provided for that user.',
        );
      }
      return Future.value(false);
    }
  }
}
