import "package:my_note/model/app_user_model.dart";

abstract class AuthenticationProvider {
  Future<void> initialize();
  AppUserModel? get currentUser;

  Future<AppUserModel> logIn({required String email, required String password});

  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required DateTime dateOfBirth,
  });

  Future<void> sendEmailVerification({required String emailAddress});

  Future<void> sendPasswordReset({required String emailAddress});

  Future<void> updatePassword({required String newPassword});

  Future<void> logOut();

  Future<void> deleteUser();
}
