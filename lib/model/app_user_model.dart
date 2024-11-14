import "package:flutter/foundation.dart";

@immutable
class AppUserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final DateTime dateOfBirth;
  final bool isEmailVerified;

  const AppUserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.isEmailVerified,
  });
}
