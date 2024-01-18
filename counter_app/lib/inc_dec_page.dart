import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final countercubit = BlocProvider.of<CounterCubit>(context);
    final counterbloc= BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              onPressed: () {},
              child: IconButton(
                icon: const Icon(Icons.add),
                // onPressed: () => countercubit.increment(),
                onPressed: () => counterbloc.add(CounterIncrement()),
              ))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // countercubit.decrement();
          counterbloc.add(CounterDecrement());
        },
        child: const Icon(Icons.minimize),
      ),
    );
  }
}
