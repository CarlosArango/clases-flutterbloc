import 'package:flutter/material.dart';
import 'package:flutter_bloc_clases/cubits/counter_cubit.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CounterCubit();
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
              StreamBuilder<int>(
                  stream: cubit.stream,
                  builder: (context, snapshot) {
                    return Text(
                      cubit.state.toString(),
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
                  cubit.increment();
                },
                child: const Text("Incrementar"),
              ),
              ElevatedButton(
                onPressed: () {
                  cubit.decrement();
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
