import 'package:shamo_app/models/product_model.dart';

class MessageModel {
  String message;
  String userId;
  String username;
  String userImage;
  bool isFromUser;
  ProductModel product;
  DateTime createdAt;
  DateTime deletedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.username,
    required this.userImage,
    required this.isFromUser,
    required this.product,
    required this.createdAt,
    required this.deletedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"] ?? '',
        userId: json["userId"] ?? 0,
        username: json["username"] ?? '',
        userImage: json["userImage"] ?? '',
        isFromUser: json["isFromUser"] ?? false,
        product: json["product"] == {}
            ? UnintializedProductModel()
            : ProductModel.fromJson(json["product"]),
        createdAt: DateTime.parse(json["createdAt"]),
        deletedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "userId": userId,
        "username": username,
        "userImage": userImage,
        "isFromUser": isFromUser,
        "product": product is UnintializedProductModel ? {} : product.toJson(),
        "createdAt": createdAt.toString(),
        "deletedAt": deletedAt.toString(),
      };
}
