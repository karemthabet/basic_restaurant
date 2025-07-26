import 'package:firebase_auth/firebase_auth.dart';
import 'failure.dart'; // Make sure the import path is correct

Failure handleFirestoreError(dynamic e) {
  if (e is FirebaseException) {
    switch (e.code) {
      case 'permission-denied':
        return FirebaseFirestoreFailure(errMessage: 'You do not have permission to access this data.');
      case 'unavailable':
        return FirebaseFirestoreFailure(errMessage: 'Service is currently unavailable. Please try again later.');
      case 'not-found':
        return FirebaseFirestoreFailure(errMessage: 'The requested document was not found.');
      case 'aborted':
        return FirebaseFirestoreFailure(errMessage: 'The operation was aborted.');
      default:
        return FirebaseFirestoreFailure(errMessage: 'Firestore error: ${e.message}');
    }
  } else if (e is FirebaseAuthException) {
    return FirebaseAuthFailure(errMessage: 'Authentication error: ${e.message}');
  } else {
    return FirebaseFirestoreFailure(errMessage: 'Unexpected error: $e');
  }
}
