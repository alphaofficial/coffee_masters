import 'package:coffee_masters/offerspage.dart';
import 'package:flutter/material.dart';

void main() {
  //dart requires a main function
  runApp(const MyApp());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key); //required on every widget

  @override
  Widget build(BuildContext context) {
    //needs to return a widget
    return const Text("Hello world!!!!!");
  }
}

class Greet extends StatefulWidget {
  const Greet({Key? key}) : super(key: key);

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "";

  @override
  Widget build(BuildContext context) {
    //we also need to return only one widget at a time
    //we have widgets that act as container so we can use that to arrange other widgets. Example is Column
    var greetStyle = const TextStyle(fontSize: 24);
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              "Hello $name",
              style: greetStyle,
            ),
            Text("!!!!", style: greetStyle),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0), //similar to px in css
        child: TextField(
          onChanged: (value) => setState(() {
            //to change stateful widget variables you use setState. This rerenders the widget
            name = value;
          }),
          style: greetStyle,
        ),
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Masters', //used as title in the OS
      theme: ThemeData(
        primarySwatch:
            Colors.brown, //Material prefers one of the colors from the system
      ),
      home: const MyHomePage(), //visible in the app screen
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Image.asset("images/logo.png"), //asset here is a named constructor
      ),
      body:
          const OffersPage(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
