import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
      create: (context) => Counter(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<Counter>(
          builder: (_, counter, ___) {
            return Text(counter.counter.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: context.read<Counter>().incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
