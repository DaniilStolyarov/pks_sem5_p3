import 'package:flutter/material.dart';
import 'package:shop_catalog/models/shopItem.dart';

List<ShopItem> ShopItems = [
  ShopItem("", "")
];

class Catalog extends StatelessWidget {
  const Catalog({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      child: ListView(
      )
    );
  }
}