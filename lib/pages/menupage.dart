import 'package:coffee_masters/datamanager.dart';
import 'package:coffee_masters/datamodel.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var p = Product(
    //   id: 1,
    //   name: "Coffee",
    //   price: 1.99,
    //   image: "",
    // );

    // var q = Product(
    //   id: 2,
    //   name: "Dummy Item",
    //   price: 5.99,
    //   image: "",
    // );

    // return ListView(
    //   children: [
    //     ProductItem(
    //       product: p,
    //       onAdd: () {},
    //     ),
    //     ProductItem(
    //       product: q,
    //       onAdd: () {},
    //     ),
    //     ProductItem(
    //       product: p,
    //       onAdd: () {},
    //     ),
    //   ],
    // );

    return FutureBuilder(
      future: dataManager.getMenu(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          //future has finished and data is ready
          var categories = snapshot.data as List<Category>;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        categories[index].name,
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: ((context, productIndex) {
                      return ProductItem(
                        product: categories[index].products[productIndex],
                        onAdd: () {},
                      );
                    }),
                  )
                ],
              );
            }),
          );
        } else {
          if (snapshot.hasError) {
            //data not there
            return Text("Error: ${snapshot.error}");
          }
          //data in progress
          return const CircularProgressIndicator();
        }
      }),
    );
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  const ProductItem({Key? key, required this.product, required this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "images/black_coffee.png",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$${product.price}"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Add"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
