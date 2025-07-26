import 'package:basic_restaurant/core/errors/errors/firebase_failure.dart';
import 'package:basic_restaurant/core/services/auth_srvice.dart';
import 'package:basic_restaurant/features/auth/data/auth_repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthService authService;

  AuthRepoImpl(this.authService);
  @override
  Future<Either<FirebaseErrorHandler, User>> signIn(
      {required String email, required String password}) async {
    try {
      final user = await authService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(user!);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseErrorHandler.fromCode(e.code));
    } catch (e) {
      return left(FirebaseErrorHandler.fromCode(e.toString()));
    }
  }

  @override
  Future<void> signOut() async {
    await authService.signOut();
  }

  @override
  Future<Either<FirebaseErrorHandler, User>> signUp(
      {required String email,
      required String password,
      required String userName}) async {
    try {
      final user = await authService.createUserWithEmailAndPassword(
          email: email, password: password);
      if (user != null) {
        await user.updateDisplayName(userName);
        await user.reload();
        final currentUser = authService.currentUser;
        return right(currentUser!);
      } else {
        return left(FirebaseErrorHandler('User creation failed'));
      }
    } on FirebaseAuthException catch (e) {
      return left(FirebaseErrorHandler.fromCode(e.code));
    } catch (e) {
      return left(FirebaseErrorHandler.fromCode(e.toString()));
    }
  }
}
