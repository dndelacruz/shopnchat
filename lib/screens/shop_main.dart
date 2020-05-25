import 'package:flutter/material.dart';

import '../widgets/products_grid.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return ProductsGrid();
    
  }
}