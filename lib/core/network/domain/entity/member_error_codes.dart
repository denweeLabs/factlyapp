// Login
abstract class LoginErrorCodes {
  static const invalidEmail = 'email_address_invalid';
  static const weakPassword = 'weak_password';
  static const userNotFound = 'user_not_found';
  static const userBanned = 'user_banned';
}


// Register
abstract class RegisterErrorCodes {
  static const invalidEmail = 'email_address_invalid';
  static const weakPassword = 'weak_password';
  static const userAlreadyExists = 'user_already_exists';
  static const disabled = 'signup_disabled';
}


// Change Password
abstract class ChangePasswordErrorCodes {
  static const weakPassword = 'weak_password';
  static const invalidCredentials = 'invalid_credentials';
}
