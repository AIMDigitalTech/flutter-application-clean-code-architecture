import '../../../../core/bloc/base_cubit.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/repositories/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends BaseCubit<LoginState> {
  final LoginRepository loginRepository;

  LoginCubit({required this.loginRepository})
      : super(const LoginState(state: AuthState.initial));

  void authenticateUserApi(String username, String password) async {
    emit(const LoginState(state: AuthState.loading));
    var loginRequest = LoginRequest(username: username, password: password);
    var loginResponse = await loginRepository.makeLoginRequest(loginRequest);
    loginResponse.fold((left) {
      // Failure
      emit(const LoginState(
          state: AuthState.error, errorMessage: 'Login Failed'));
    }, (right) {
      // Success.
      emit(const LoginState(
        state: AuthState.success,
      ));
    });
  }
}
