import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  PasswordBloc() : super(PasswordInitial()) {
    on<PasswordEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
