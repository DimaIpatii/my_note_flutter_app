import 'package:my_note/model/app_user_model.dart';
import 'package:my_note/services/authentication/mock_auth_service.dart';
import 'auth_provider.dart';

class AuthenticationServices implements AuthenticationProvider {
  final AuthenticationProvider provider;
  const AuthenticationServices(this.provider);

  factory AuthenticationServices.mockPrivider() =>
      AuthenticationServices(MockAuthService());

  @override
  Future<void> createUser(
      {required String firstName,
      required String lastName,
      required String email,
      required DateTime dateOfBirth}) async {
    provider.createUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        dateOfBirth: dateOfBirth);
  }

  @override
  AppUserModel? get currentUser => provider.currentUser;

  @override
  Future<void> deleteUser() async {
    provider.deleteUser();
  }

  @override
  Future<void> initialize() async {
    provider.initialize();
  }

  @override
  Future<AppUserModel> logIn({
    required String email,
    required String password,
  }) async {
    return provider.logIn(email: email, password: password);
  }

  @override
  Future<void> logOut() async {
    provider.logOut();
  }

  @override
  Future<void> sendEmailVerification({required String emailAddress}) async {
    provider.sendEmailVerification(emailAddress: emailAddress);
  }

  @override
  Future<void> sendPasswordReset({required String emailAddress}) async {
    provider.sendPasswordReset(emailAddress: emailAddress);
  }

  @override
  Future<void> updatePassword({required String newPassword}) async {
    provider.updatePassword(newPassword: newPassword);
  }
}
