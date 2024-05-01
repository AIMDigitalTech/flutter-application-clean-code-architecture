import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/bloc/network_cubit.dart';
import '../../../../core/bloc/network_state.dart';
import '../cubit/login_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  late String _email;
  late String _password;
  late String _displayName;
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: MultiBlocListener(
        listeners: [
          BlocListener<NetworkCubit, NetworkState>(
            listener: (context, state) {
              var snackBar = SnackBar(
                content: Text(
                  state.message,
                  style: const TextStyle(color: Colors.white),
                ),
              );
              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
          ),
        ],
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (oldState, newState) {},
          builder: (BuildContext context, state) {
            return const Center();
          },
        ),
      ),
    );
  }

  void _loginUser() {
    _email = _emailController.text;
    _password = _passwordController.text;
    _emailController.clear();
    _passwordController.clear();
  }
}
