import 'package:flutter/material.dart';

// Main method, runs Class MyApp
void main() {
  runApp(const MyApp());
}

// Main Class of Application (Root)
//  Has 1 widget (the application root)
//    Title, Theme (ColorScheme), HomePage
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // WHAT IS THIS???
  @override // WHAT IS THIS???
  Widget build(BuildContext context) { // Application Root Widget
    return MaterialApp( // WHAT IS THIS???
      title: 'My Flutter Demo', // Title
      theme: ThemeData( // This is the theme of your application.
        primarySwatch: Colors.green, // ColorScheme
      ),
      home: const MyHomePage(title: 'Home Page'), // HomePage
    );
  }
}

// Application Home Page
//  This widget is stateful (has a State object - contains fields that affect how it looks.)
//    This class is the configuration for the state
//  Title - provided by parent (MyApp) - and used by the build method of the State
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key); // WHAT IS THIS???
  final String title; // Page title (Fields in a Widget subclass are marked "final")
  @override // WHAT IS THIS???
  State<MyHomePage> createState() => _MyHomePageState(); //Page State
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() { // setState() (something changed in State) calls build() - display reflects updated values
      _counter++; // updating _counter without setState() would not rebuild (nothing would appear to happen)
    });
  }
  @override // WHAT IS THIS???

  Widget build(BuildContext context) { // build() called on setState - fast & updates all required widgets at once
    return Scaffold(
      appBar: AppBar( // title set from MyHomePage object was created by App.build()
        title: Text(widget.title),
      ),
      body: Center( // Center() (layout widget) positions 1 child (middle of parent)
        child: Column( // Column() (layout widget) vertically arranges a list of children (Columns are vertical)
            // Default - width: fit children, height: parent. (Properties control its size and children's positions)
          mainAxisAlignment: MainAxisAlignment.center, // vertically centers children.
          children: <Widget>[ //Array of elements
            Text('You have pressed this button $_counter times!',),
            Text('$_counter', style: Theme.of(context).textTheme.headline4,),
          ],),),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child:
        const Icon(Icons.add),
      ),);
  }
}

// trailing commas - nicer auto-formatting for build()

// Invoke "debug painting" to see the wireframe for each widget.
//  press "p" in the console, choose the "Toggle Debug Paint" action
//    from the Flutter Inspector in Android Studio