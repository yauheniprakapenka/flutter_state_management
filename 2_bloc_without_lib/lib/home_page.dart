import 'package:flutter/material.dart';

import 'counter_bloc.dart';
import 'counter_event.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final bloc = CounterBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
                stream: bloc.state,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text('${snapshot.data ?? ''}');
                  }
                  return CircularProgressIndicator.adaptive();
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.event.add(CounterEvent.increase),
        child: Icon(Icons.add),
      ),
    );
  }
}
