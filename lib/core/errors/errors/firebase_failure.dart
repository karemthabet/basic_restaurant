class FirebaseErrorHandler {
  final String message;

  FirebaseErrorHandler(this.message);

  factory FirebaseErrorHandler.fromCode(String code) {
    return FirebaseErrorHandler(getMessageFromCode(code));
  }

  static String getMessageFromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already in use.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'operation-not-allowed':
        return 'Email/password accounts are not enabled.';
      case 'weak-password':
        return 'The password is too weak.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'The password is incorrect.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'missing-password':
        return 'Password is required.';
      case 'missing-email':
        return 'Email is required.';
      case 'invalid-credential':
        return 'Invalid password or email . Please check your account info.';
      default:
        return 'An unexpected error occurred. Please try again.';
    }
  }
}
