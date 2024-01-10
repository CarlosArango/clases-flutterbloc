import 'package:flutter_bloc_clases/cubits/counter_cubit.dart';

void main() {
  // Creamos una instancia de CounterCubit
  final cubit = CounterCubit();

  // Escuchamos los cambios de estado
  cubit.stream.listen((state) {
    print('Estado actual: $state');
  });

  // Emitimos algunos eventos
  cubit.increment();
  cubit.increment();
  cubit.decrement();
  cubit.increment();

  // Cerramos el StreamController cuando ya no necesitamos emitir más eventos
  cubit.close();
}
