import 'package:flutter/material.dart';

import 'food_list.dart';

class FoodListScreen extends StatelessWidget {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning BLoC')),
      body: FoodList()
    );
  }

}