import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop_catalog/models/shop_item.dart';
import 'package:shop_catalog/pages/item_view.dart';


class Catalog extends StatefulWidget {
  const Catalog({super.key});
  @override
  createState() => CatalogState();
}

class CatalogState extends State<Catalog>
{
  List<ShopItem> shopItems = [];
  @override void initState() {
    super.initState();
    loadShopItems();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 0),
          itemCount: shopItems.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              child: CardPreview(shopItems: shopItems, index: index),
              onTap: () {
                debugPrint('tapped ${shopItems[index].Name}');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ItemView(shopItem: shopItems[index]))
                );
              },
            );
          },
        ),
      )
    );
  }
  Future<void> loadShopItems() async {
    String jsonString = await rootBundle.loadString('static/Services.json');
    List<dynamic> jsonList = jsonDecode(jsonString);
    
    setState(() {
      shopItems = jsonList.map((json) => ShopItem.fromJson(json)).toList();
    });
    
  }
}

class CardPreview extends StatelessWidget {
  const CardPreview({
    super.key,
    required this.shopItems,
    required this.index
  });

  final List<ShopItem> shopItems;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset('static/' + shopItems[index].ImageHref, width: double.infinity, height: MediaQuery.of(context).size.width / 2, fit: BoxFit.cover)
            ),
            SizedBox(height: 20,),
            Text(shopItems[index].Name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              )
            ),
          ],
        ),
      )
    );
  }
}

