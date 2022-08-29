import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'package:flutter_catalog/models/cartmodel.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widgets/product_list.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart';
import '../widgets/home_widgets/cart_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // final cartJson = await rootBundle.loadString("assets/files/cart.json");
    // final response = await http.get(Uri.parse(url));
    // var decodedData = jsonDecode(cartJson);
    // var productsData = decodedData["products"];
    // await Future.delayed(Duration(seconds: 2));
    CircularProgressIndicator().centered();
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    final dummyList = List.generate(8, (index) => CatalogModel.items[index]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (BuildContext context, store, VxStatus? status) =>
            FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        )
                .badge(
                    color: Vx.blue400,
                    size: 22,
                    count: _cart.items.length,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white))
                .p12(),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CartHeader(), CatalogList().py16().expand()],
          ),
        ),
      ),
    );
  }
}
