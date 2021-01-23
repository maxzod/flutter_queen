import 'package:flutter/material.dart';
import 'package:flutter_queen/flutter_queen.dart';

void main() {
  Queen.removeTheHash();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          QueenNavBar(
            // logo: Text('help'),
            children: [
              Text('one'),
              Text('two'),
              Text('three'),
              Text('four'),
            ],
          ),
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            'ss',
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      ),
    );
  }
}
