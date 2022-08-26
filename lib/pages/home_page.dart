import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var cartJson = await rootBundle.loadString("assets/files/cart.json");
    var decodedData = jsonDecode(cartJson);
    var productsData = decodedData["products"];
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(10, (index) => CatalogModel.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EKart",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
