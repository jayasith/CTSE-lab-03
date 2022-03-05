import 'package:flutter/material.dart';
import 'package:lab_03/data.dart';

class CartProvider extends ChangeNotifier {
  Set<Item> _items = {};

  Set<Item> get items => _items;

  bool isItemAdded(Item item) {
    return _items.contains(item);
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  double get total =>
      _items.fold(0.0, (previousValue, item) => previousValue + item.price);
}
