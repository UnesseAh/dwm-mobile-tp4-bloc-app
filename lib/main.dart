import 'package:dwm_bloc_app/bloc/counter.bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => CounterBloc()),
    ], child: RootView());
  }
}

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage()
    );
  }
}

class CounterPage extends StatelessWidget {
  CounterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter page", style: TextStyle(color: Theme.of(context).indicatorColor),),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
                builder: ((context, state) {
                  return Text(
                    "Counter Value => ${state.counter}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  );
                })
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(DecrementCounterEvent());
          },
          child: Icon(Icons.remove)
          ),
          SizedBox(width: 20),
          FloatingActionButton(onPressed: (){
            context.read<CounterBloc>().add(IncrementCounterEvent());

          },
              child: Icon(Icons.add)),
        ],
      ),
    );
  }
}
