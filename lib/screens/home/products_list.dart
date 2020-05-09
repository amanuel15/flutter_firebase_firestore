import 'package:flutter/material.dart';
import 'package:main_test/models/product.dart';
import 'package:provider/provider.dart';
import 'package:main_test/screens/home/products_tile.dart';

class ProductsList extends StatefulWidget {
  @override
  _ProductsListState createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {

    final products = Provider.of<List<Product>>(context);
    products.forEach((product){
      print(product.name);
      print(product.amount);
      print(product.productDescription);
    });

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index){
        return ProductTile(product: products[index]);
      },
    );
  }
}