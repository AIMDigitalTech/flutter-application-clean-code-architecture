part of 'login_cubit.dart';

enum AuthState {
  initial,
  loading,
  success,
  error,
}

class LoginState {
  final AuthState state;
  final String? errorMessage;

  const LoginState({
    required this.state,
    this.errorMessage,
  });
}
