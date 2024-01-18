import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/inc_dec_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  // We have used BlocProvider so we do not need to create instance here
  @override
  Widget build(BuildContext context) {
    final countercubit = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
                bloc: countercubit,
                builder: (context, counter) {
                  return Text(
                    '$counter',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }),
          ],
        ),
      ),
      // If we want to have these buttons in next page then...
      // We do not want to pass instance of countercubit everytime so we use BlocProvider

      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed:(){
      //         countercubit.increment();
      //       },
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.add),
      //     ),
      //     SizedBox(height: MediaQuery.of(context).size.height*0.01,),
      //     FloatingActionButton(
      //       onPressed:(){
      //         countercubit.decrement();
      //       },
      //       tooltip: 'Increment',
      //       child: const Icon(Icons.minimize),
      //     ),

      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>IncDecPage()));
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
