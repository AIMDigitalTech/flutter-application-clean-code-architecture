import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/widgets/snackbar_widget.dart';
import '../cubit/login_cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginCubit _loginCubit;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginCubit = BlocProvider.of<LoginCubit>(context);
  }

  @override
  void dispose() {
    _loginCubit.close();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (oldState, newState) {
        if (newState.state == AuthState.error) {
          ScaffoldMessenger.of(context).showSnackBar(snackBarWhenFailure(
              snackBarFailureText: newState.errorMessage ?? ""));
        } else if (newState.state == AuthState.success) {
          ScaffoldMessenger.of(context).showSnackBar(snackBarWhenSuccess());
          context.go('/home');
        }
      },
      builder: (context, state) {
        return state.state == AuthState.loading
            ? const Positioned(
                child: Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _usernameController,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText: 'Password'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _loginCubit.authenticateUserApi(
                          _usernameController.text,
                          _passwordController.text,
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
