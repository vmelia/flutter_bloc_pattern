part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({this.counter});

  @override
  List<Object> get props => [counter];
}
