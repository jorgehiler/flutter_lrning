import 'package:flutter/material.dart';

import 'food_list_screen.dart';

class FoodForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {

  String _foodname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pattern Bloc')),
      body: Container(
        padding: EdgeInsets.all(36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Learning Bloc', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Food'),
                style: TextStyle(fontSize: 22),
                onChanged: (text) {
                  _foodname = text;
                },
              ),
              SizedBox(height: 20),
              FoodList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'button1',
            child: Icon(Icons.save),
            onPressed: (){},
          ),
          SizedBox(height: 14),
          FloatingActionButton(
            heroTag: 'button2',
            child: Icon(Icons.navigate_next),
            onPressed: () => Navigator.push(
             context, MaterialPageRoute(builder: (context) => FoodListScreen()) ),
            )
        ],
      ),
    );
  }
}

class FoodList extends StatelessWidget{
  @override
  Widget build(Object context) {
    return Container(child: Text("ejemplo"));
  }
}
