class Order {
  final int id;
  final int user;
  final int total;
  final String status;

  Order({
    required this.id,
    required this.user,
    required this.total,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['order_id'],
      user: json['user_id'],
      total: json['total'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() => {
        'porder_id': id,
        'user_id': user,
        'total': total,
        'status': status,
      };
}
