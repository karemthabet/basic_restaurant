import 'package:basic_restaurant/core/errors/errors/firebase_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo{
Future<Either<FirebaseErrorHandler,User>>signIn({required String email, required String password});
Future<Either<FirebaseErrorHandler,User>>signUp({required String email, required String password,required String userName});

Future<void>signOut();

}