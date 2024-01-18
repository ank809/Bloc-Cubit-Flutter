import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  // Here 0 is the initial state
  CounterCubit():super(0);

  void increment(){
    // can't do something like that to increase our state because state is a getter
    // state= state+1;

  // by using emit function we can update our state
  // emit is a protected function so we should not use it outside the class 
    emit(state+1);
  }

  void decrement(){
    if(state==0){
      return ;
    }
    emit(state-1);
  }
}