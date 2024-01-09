import 'dart:async';

void streamController() {
  // Creamos un StreamController para emitir eventos
  StreamController<int> streamController = StreamController<int>();

  // Creamos un Stream a partir del StreamController
  Stream<int> stream = streamController.stream;

  // Escuchamos los eventos del Stream
  stream.listen((data) {
    print('Evento recibido: $data');
  });

  // Emitimos algunos eventos al Stream
  streamController.sink.add(1);
  streamController.sink.add(2);
  streamController.sink.add(3);

  // Cerramos el StreamController cuando ya no necesitamos emitir más eventos
  streamController.close();
}

void streamAsyncYield() {
  Stream<int> countStream(int max) async* {
    for (int i = 1; i <= max; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  Stream<int> stream = countStream(3);

  stream.listen((data) {
    print('Evento recibido: $data');
  });
}

void main() {
  streamController();
  streamAsyncYield();
}
