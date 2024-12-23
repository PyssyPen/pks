class Tovar {
  final int id;
  final String name;
  final String description;
  final String price;
  final String url; // Новое поле для изображения

  Tovar({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.url, // Новое поле для изображения
  });

  factory Tovar.fromJson(Map<String, dynamic> json) {
    return Tovar(
      id: json['ID'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'],
      url: json['ImageURL'], // Предполагаем, что API возвращает это поле
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'ID': id,
      'Name': name,
      'Description': description,
      'Price': price,
      'ImageURL': url,
    };
}