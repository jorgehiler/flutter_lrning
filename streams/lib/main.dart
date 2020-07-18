import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //For default is SingleSuscription that means that during whole lifecycle has
  //only one suscriptor and can't suscribe again after unsubscribe
  StreamController<double> controller = StreamController<double>();
  StreamSubscription<double> streamSubscription;
  //For singleSuscription when suscribe it receive all emit values before suscription
  // at the same time and not in Broadcast.

  static Stream<int> randomNumber;

  _MyAppState() {
    randomNumber = getDelayRandomValue();
    randomNumber.listen((event) {
      print('$event');
    });
  }

  @override
  Widget build(BuildContext context) {
    print("entro");
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          body: Center(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MaterialButton(
                      child: Text("Subscribe"),
                      color: Colors.yellow[200],
                      onPressed: () {
                        Stream stream = controller.stream;
                        streamSubscription = stream.listen((value) {
                          print("value from the controller $value");
                        });
                      },
                    ),
                    MaterialButton(
                      child: Text("Emit Value"),
                      color: Colors.green[200],
                      onPressed: () {
                        controller.add(20);
                      },
                    ),
                    MaterialButton(
                        child: Text("Unsubscribe"),
                        color: Colors.red[200],
                        onPressed: () {
                          streamSubscription.cancel();
                        }),
                  ],
                ),
                Column(children: <Widget>[
                  SizedBox(
                    child: Text("Cronometro"),
                  ),
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () {
                    },
                    child: Icon(Icons.timer),
                  ),
                  StreamBuilder(
                    stream: randomNumber,
                    initialData: 0,
                    builder: (context, snapshot) {
                      return Text('${snapshot.data}');
                    },
                  )
                ])
              ],
            ),
          ),
        ));
  }

  static Stream<int> getDelayRandomValue() async* {
    Random random = Random();
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextInt(100);
    }
  }
}
