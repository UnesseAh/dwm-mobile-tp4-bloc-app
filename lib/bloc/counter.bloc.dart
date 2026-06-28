import 'package:bloc/bloc.dart';

abstract class CounterEvent{}
class IncrementCounterEvent extends CounterEvent{}
class DecrementCounterEvent extends CounterEvent{}

class CounterState {
  final int counter;
  CounterState(this.counter);
}
class InitialState extends CounterState {
  InitialState() : super(5);
}
class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(InitialState()){
    on((IncrementCounterEvent event, emit){
      emit(CounterState(state.counter + 1));
    });
    on((DecrementCounterEvent event, emit){
      emit(CounterState(state.counter + 1));
    });
  }
}