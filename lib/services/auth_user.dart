import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final bool isEmailVerified;
  const AuthUser(this.isEmailVerified);

  // Make a copy of the firebase user into our own user.
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
