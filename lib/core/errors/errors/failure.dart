import 'package:cloud_firestore/cloud_firestore.dart';

/// Base class for all failures
abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

/// Failure related to Firebase Authentication
class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure({required super.errMessage});
}

/// Failure related to Firestore
class FirebaseFirestoreFailure extends Failure {
  FirebaseFirestoreFailure({required super.errMessage});
}

/// A helper function to handle Firestore exceptions
FirebaseFirestoreFailure handleFirestoreError(FirebaseException exception) {
  switch (exception.code) {
    case 'permission-denied':
      return FirebaseFirestoreFailure(
        errMessage: 'You do not have permission to access this data.',
      );
    case 'unavailable':
      return FirebaseFirestoreFailure(
        errMessage: 'Service is currently unavailable. Please try again later.',
      );
    case 'not-found':
      return FirebaseFirestoreFailure(
        errMessage: 'The requested document was not found.',
      );
    case 'aborted':
      return FirebaseFirestoreFailure(
        errMessage: 'The operation was aborted. Please try again.',
      );
    default:
      return FirebaseFirestoreFailure(
        errMessage: 'Unexpected error: ${exception.message}',
      );
  }
}
