import 'package:blocflutter/bloc/food_bloc.dart';
import 'package:flutter/material.dart';
import 'package:blocflutter/state/food_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/food_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = FoodBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (BuildContext context) => FoodBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FoodForm(),
      ),
    );
  }
}
