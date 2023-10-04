import 'dart:convert';
import 'package:e_joint_mobile/models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  final String _cartKey = "cartKey";

  Future addToCart(CartItem item) async {
    try {
      List<CartItem> cart = await getCart();
      cart.add(item);
      await _saveCart(cart);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future removeFromCart(String id) async {
    List<CartItem> cart = await getCart();
    cart.removeWhere((item) => item.id == id);
    await _saveCart(cart);
    return true;
  }

  Future<double> getCartTotal() async {
    double total = 0.0;
    List<CartItem> cartItems = await getCart();

    for (CartItem item in cartItems) {
      total += item.price * item.quantity;
    }

    return total;
  }

  Future<List<CartItem>> getCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getString(_cartKey) ?? '[]';
    final cartList = json.decode(cartJson) as List;

    return cartList.map((item) => CartItem.fromJson(item)).toList();
  }

  Future<void> _saveCart(List<CartItem> cart) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = json.encode(cart.map((item) => item.toJson()).toList());
    prefs.setString(_cartKey, cartJson);
  }
}
