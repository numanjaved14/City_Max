import 'package:flutter/foundation.dart';

class CartItem {
  final String uuid;
  final String type;
  final String category;
  final String subCategory;
  final String desc;
  final int quantity;
  final double price;

  CartItem({
    required this.uuid,
    required this.type,
    required this.category,
    required this.subCategory,
    required this.desc,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem({
    required String uuid,
    required double price,
    required String type,
    required String desc,
    required String category,
    required String subCategory,
  }) {
    if (_items.containsKey(uuid)) {
      // change quantity...
      _items.update(
        uuid,
        (existingCartItem) => CartItem(
          uuid: existingCartItem.uuid,
          type: existingCartItem.type,
          category: existingCartItem.category,
          subCategory: existingCartItem.subCategory,
          desc: existingCartItem.desc,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        uuid,
        () => CartItem(
          uuid: uuid,
          type: type,
          desc: desc,
          category: category,
          subCategory: subCategory,
          price: price,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem({required String uuid}) {
    _items.remove(uuid);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
