import 'package:flutter/material.dart';

import '../model/product.dart';
import './product_details.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: Image.network(
        product.images[0],
        fit: BoxFit.cover,
      ),
    );

    return GestureDetector(
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(4))),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              GridTileBar(
                backgroundColor: Colors.black45,
                title: _GridTitleText(product.title),
                subtitle: _GridTitleText(product.description),
              ),
              Positioned(
                top: -4,
                right: -4,
                child: IconButton(
                  color: Theme.of(context).accentColor,
                  icon: Icon(Icons.add_shopping_cart),
                  onPressed: () {},
                ),
              ),
              Positioned(
                top: -12,
                left: -20,
                child: Image.network('https://firebasestorage.googleapis.com/v0/b/shopnchat-cd662.appspot.com/o/hot_badge.png?alt=media&token=c528deee-35a4-4ad2-a58b-b42e38b0ff78',
                  fit: BoxFit.cover,
                  height: 60,
                ),
              )
              
              
            ],
          ),
        ),
        child: image,
      ),
      onTap: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => ProductDetails(product))),
    );
  }
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold))
    );
  }
}
