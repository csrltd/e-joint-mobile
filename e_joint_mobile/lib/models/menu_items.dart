class MenuItem {
  final int id;
  final String name;
  final String description;
  final String price;
  final String image;
  final bool availability;
  final int restaurant;
  final List<int> categories;

  MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.availability,
    required this.restaurant,
    required this.categories,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        price: json['price'],
        image: json['image'],
        availability: json['availability'],
        restaurant: json['restaurant'],
        categories: List<int>.from(json['categories']));
  }
}
