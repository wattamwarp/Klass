import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_app_klass/core/exception/failure.dart';
import 'package:flutter_app_klass/data/repositories/auth/base_auth_repo.dart';

class AuthRepositroy extends BaseAuthRepository {
  AuthRepositroy({auth.FirebaseAuth? firebaseAuth})
      : _firebasAuth = firebaseAuth ?? auth.FirebaseAuth.instance,
        super();
  final auth.FirebaseAuth _firebasAuth;

  @override
  Stream<auth.User?> get user => _firebasAuth.userChanges();
  @override
  Future logOut() async {
    await _firebasAuth.signOut();
  }

  @override
  Future<auth.User> signIn() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);

      return user.user!;
    } on auth.FirebaseAuthException catch (e) {
      // ignore: only_throw_errors
      throw Failure(code: e.code, message: e.message!);
    } on PlatformException catch (e) {
      // ignore: only_throw_errors
      throw Failure(code: e.code, message: e.message.toString());
    }
  }
}
