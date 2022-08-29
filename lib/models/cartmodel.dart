import 'package:flutter_catalog/models/cart.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;


  // catalog field
  late CatalogModel _product;

  // Collection of IDs - store Ids of each item
  final List<int> _itemIds = [];

  // Get Catalog
  CatalogModel get catalog => _product;

  set catalog(CatalogModel newProduct) {
    assert(newProduct != null);
    _product = newProduct;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _product.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove Item

  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
