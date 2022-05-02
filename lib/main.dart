import 'package:coffee_masters/pages/menupage.dart';
import 'package:coffee_masters/pages/offerspage.dart';
import 'package:coffee_masters/pages/orderpage.dart';
import 'package:flutter/material.dart';

import 'datamanager.dart';

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
  var dataManager = DataManager();
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget currentWidgetPage = const Text("dummy");

    switch (selectedIndex) {
      case 0:
        currentWidgetPage = MenuPage(
          dataManager: dataManager,
        );
        break;
      case 1:
        currentWidgetPage = const OffersPage();
        break;
      case 2:
        currentWidgetPage = OrderPage(
          dataManager: dataManager,
        );
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(
        title:
            Image.asset("images/logo.png"), //asset here is a named constructor
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
          });
        },
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow.shade400,
        unselectedItemColor: Colors.brown.shade50,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: "Offers",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout),
            label: "Order",
          )
        ],
      ),
      body:
          currentWidgetPage, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
