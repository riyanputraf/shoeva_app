import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo_app/models/product_model.dart';


class ProductService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(Uri.parse(url), headers: headers);


    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<ProductModel> products = [];

      for (var item in data) {
        /// jika menjalankan di localhost pakai metode ini
        // List<GalleryModel> galleries = [];
        // for (var gallery in item['galleries']) {
        //   gallery['url'] = updateLocalhostUrl(gallery['url']);
        //   galleries.add(GalleryModel.fromJson(gallery));
        // }
        // item['galleries'] = galleries;

        /// jika tidak menjalankan di localhost cukup pakai ini saja
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal Get Products');
    }
  }
}
