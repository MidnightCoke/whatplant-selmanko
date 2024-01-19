class OrderModel {
  final List<String> plantNames;

  OrderModel(this.plantNames);

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      List<String>.from(json['plantNames']),
    );
  }
}
