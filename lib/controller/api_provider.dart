import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Model/product2.dart';

class ProductsProvider extends ChangeNotifier{

  List<Products> futureProducts = [];
  bool isLoading=false;
  bool isApiError=false;


  void getProductsApi() async {
    isLoading=true;
    try {
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
         isApiError=false;
        isLoading=false;
        futureProducts =  productsFromJson(response.body);
        notifyListeners();
      } else {
        isLoading=false;
        isApiError=true;
        notifyListeners();
      }
    } catch (e) {
      isLoading=false;
      isApiError=true;
      notifyListeners();
      throw Exception("Failed to load products: $e");
    }
  }

}