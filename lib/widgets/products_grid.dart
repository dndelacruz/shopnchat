import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product.dart';
import './product_tile.dart';

class ProductsGrid extends StatefulWidget {
  @override
  _ProductsGridState createState() => _ProductsGridState();
}

class _ProductsGridState extends State<ProductsGrid> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance
        .collection('products')
        .snapshots(),
      builder: (ctx, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        else
          {
            final products = snapshot.data.documents;
            // print(products.length);
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: products.length,
              itemBuilder: (_, index) => ProductTile(
                Product(
                  id: products[index].documentID,
                  title: products[index]['title'],
                  description: products[index]['description'],
                  // imageUrl: products[index]['imageUrl'],
                  images: products[index]['images']
                )
              ),
            );
          }
      },
    );
  }
}