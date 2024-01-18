import 'package:flutter_bloc/flutter_bloc.dart';
// To consider both the files as single one 
part 'counter_event.dart';

// Bloc expects 2 args i.e event and state
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecrement>((event, emit) {
      if (state==0){
        return;
      }
      emit(state -1);
    });
  }
}
