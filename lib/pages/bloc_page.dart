import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_pattern/bloc/counter_bloc.dart';

class BlocPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc Page'), centerTitle: true),
      body: BlocConsumer(
        cubit: BlocProvider.of<CounterBloc>(context),
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.counter.toString(),
                  style: TextStyle(fontSize: 40),
                ),
                ElevatedButton(
                  child: Text('Increment'),
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
                  },
                ),
                ElevatedButton(
                  child: Text('Decrement'),
                  onPressed: () {
                    BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
