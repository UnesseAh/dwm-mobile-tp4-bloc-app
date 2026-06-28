import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RootView();
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
  int counter = 0;

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
            Text("Counter value => $counter", style: Theme.of(context).textTheme.headlineSmall,)
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: (){
            --counter;
          },
          child: Icon(Icons.remove)
          ),
          SizedBox(width: 20),
          FloatingActionButton(onPressed: (){
            ++counter;
          },
              child: Icon(Icons.add)),
        ],
      ),

    );
  }
}
