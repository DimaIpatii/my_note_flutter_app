import "dart:async";
import 'package:my_note/model/app_user_model.dart';
import 'package:my_note/services/authentication/auth_exeptions.dart';
import 'package:my_note/services/authentication/auth_provider.dart';

class MockAuthService implements AuthenticationProvider {
  AppUserModel? _currentUser;
  String _password = "Test123!";

  bool _isInitialized = false;
  bool _isEmailVerified = false;

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 3));
    _isInitialized = true;
  }

  @override
  AppUserModel? get currentUser => _currentUser;

  @override
  Future<void> createUser({
    required String firstName,
    required String lastName,
    required String email,
    required DateTime dateOfBirth,
  }) async {
    if (_isInitialized == false) throw NotInitializedExeption();

    await Future.delayed(const Duration(seconds: 2));
    _isEmailVerified = false;

    final user = AppUserModel(
      id: "my_id",
      email: email,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      isEmailVerified: _isEmailVerified,
    );

    _currentUser == user;
  }

  @override
  Future<void> deleteUser() async {
    if (_isInitialized == false) throw NotInitializedExeption();
    if (_currentUser == null) throw UserNotLoggedInExeption();

    Future.delayed(const Duration(seconds: 1));
    _currentUser = null;
    _isEmailVerified = false;
  }

  @override
  Future<AppUserModel> logIn({
    required String email,
    required String password,
  }) async {
    if (_isInitialized == false) throw NotInitializedExeption();

    Future.delayed(const Duration(seconds: 1));

    if (_currentUser != null &&
        _currentUser?.email == email &&
        password == _password) {
      return _currentUser!;
    }

    throw WrongCredentialsExeption();
  }

  @override
  Future<void> logOut() async {
    if (_isInitialized == false) throw NotInitializedExeption();
    if (_currentUser == null) throw UserNotLoggedInExeption();

    await Future.delayed(const Duration(seconds: 2));
    _isEmailVerified = false;
    _currentUser = null;
  }

  @override
  Future<void> sendEmailVerification({required String emailAddress}) async {
    if (_isInitialized == false) throw NotInitializedExeption();

    await Future.delayed(const Duration(seconds: 2));

    if (_currentUser != null || _currentUser?.email == emailAddress) {
      _isEmailVerified = true;
      _currentUser = AppUserModel(
          id: "my_id",
          email: _currentUser!.email,
          firstName: _currentUser!.firstName,
          lastName: _currentUser!.lastName,
          dateOfBirth: _currentUser!.dateOfBirth,
          isEmailVerified: _isEmailVerified);
    }
  }

  @override
  Future<void> sendPasswordReset({required String emailAddress}) async {
    if (_isInitialized == false) throw NotInitializedExeption();

    if (_currentUser == null) throw UserNotLoggedInExeption();

    if (_currentUser != null && _currentUser?.email != emailAddress) {
      throw UserNotFoundException();
    }

    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  Future<void> updatePassword({required String newPassword}) async {
    if (_isInitialized == false) throw NotInitializedExeption();

    if (_currentUser == null) throw UserNotLoggedInExeption();

    await Future.delayed(const Duration(seconds: 2));

    _password = newPassword;
  }
}
