import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/bloc/counter/counter_bloc.dart';

class BlocCounterWidget extends StatelessWidget {
  const BlocCounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = CounterBloc();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter widget"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<CounterState>(
                  stream: bloc.stream,
                  initialData: bloc.state,
                  builder: (context, snapshot) {
                    return Text(
                      bloc.state.counter.toString(),
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  bloc.add(const CounterIncrementBtnPressed());
                },
                child: const Text("Incrementar"),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.add(const CounterDecrementBtnPressed());
                },
                child: const Text("Decrementar"),
              ),
            ],
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
