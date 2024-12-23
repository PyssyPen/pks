class CartModel {
  final int id;
  final String price;
  final String url; 
  final int count;

  CartModel({
    required this.id,
    required this.price,
    required this.url,
    required this.count
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['ID'],
      price: json['Price'],
      url: json['ImageURL'], 
      count: json['Count']
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'ID': id,
      'Price': price,
      'ImageURL': url,
      'Count': count
    };
}