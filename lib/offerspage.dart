import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Offer(
      title: "My great offer ever",
      description: "Buy 1, get 10 for free",
    );
  }
}

class Offer extends StatelessWidget {
  //properties
  final String title; //properties are usually final because they are immutable
  final String description;

  const Offer({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 150,
        child: Card(
          color: Colors.amber.shade300,
          elevation: 7,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/background.png"),
              ),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child:
                      Text(title, style: Theme.of(context).textTheme.headline5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(description,
                      style: Theme.of(context).textTheme.headline6),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
