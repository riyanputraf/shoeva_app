import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/models/user_model.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage(
    UserModel user,
    bool isFromUser,
    String message,
    ProductModel product,
  ) async {
    try {
      firestore.collection('messages').add({
        'userId': user.id,
        'username': user.name,
        'userImage': user.profilePhotoUrl,
        'isFromUser': true,
        'message': message,
        'product': product is UnintializedProductModel ? {} : product.toJson(),
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then(
        (value) => print('Pesan Berhasil Terkirim'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Terikirm');
    }
  }
}
