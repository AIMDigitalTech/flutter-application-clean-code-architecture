import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportInitial()) {
    on<SupportEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
