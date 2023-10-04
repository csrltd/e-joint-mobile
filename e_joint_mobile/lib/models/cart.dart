class CartItem {
  final String id;
  final String name;
  final double price;
  final double quantity;

  CartItem(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
