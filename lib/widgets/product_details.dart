import 'package:flutter/material.dart';

import '../model/product.dart';
import './messages.dart';
import './new_message.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Container(
        margin: const EdgeInsets.all(4),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  width: double.infinity,
                  child: Card(
                      clipBehavior: Clip.antiAlias,
                      child:
                          Image.network(product.images[0], fit: BoxFit.cover)),
                ),
                Positioned(
                    top: -24,
                    left: -38,
                    child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/shopnchat-cd662.appspot.com/o/hot_badge.png?alt=media&token=c528deee-35a4-4ad2-a58b-b42e38b0ff78',
                      fit: BoxFit.cover,
                      height: 120,
                    )),
                Positioned(
                  bottom: -8,
                  right: 12,
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).accentColor,
                    foregroundColor: Colors.white,
                    child: IconButton(icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {},
                    ),
                  ),
                  )
              ],
              overflow: Overflow.visible,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  product.title,
                  style: Theme.of(context).textTheme.headline6,
                )),
                Text(
                  'P 243.50',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            Expanded(child: Messages(product.id),),
            NewMessage(product.id),
          ],
        ),
      ),
    );
  }
}
