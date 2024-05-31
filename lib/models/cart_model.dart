import 'package:shamo_app/models/product_model.dart';

class CartModel {
  int id;
  int quantity;
  ProductModel product;

  CartModel({
    required this.id,
    required this.quantity,
    required this.product,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        quantity: json["quantity"],
        product: ProductModel.fromJson(
          json["product"],
        ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "product": product.toJson(),
      };

  double getTotalPrice() {
    return product.price * quantity;
  }
}
