class OrderItem {
  final int id;
  final String name;
  final String description;
  final String price;
  final String image;
  final bool availability;
  final int restaurant;

  OrderItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.availability,
    required this.restaurant,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      availability: json['availability'],
      restaurant: json['restaurant'],
    );
  }
}
