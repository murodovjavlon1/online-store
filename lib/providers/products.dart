import 'package:flutter/material.dart';
import 'package:pro/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _list = [
     Product(
        id: "j1",
        title: "MacBook Pro 14 M1",
        description: "Yangi MacBook Pro kuchli M1 chipi bilan.",
        price: 1500,
        imagUrll:
            "https://images.unsplash.com/photo-1517336714731-489689fd1ca8?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9vayUyMHByb3xlbnwwfHwwfHx8MA%3D%3D"),
    Product(
        id: "j2",
        title: "MacBook Pro 13 M2",
        description: "Yangi avlod MacBook Pro M2 chipi bilan.",
        price: 1400,
        imagUrll:
            "https://www.shutterstock.com/image-illustration/macbook-pro-2023-m2-chip-600nw-2328203513.jpg"),
    Product(
        id: "j3",
        title: "MacBook Air M2",
        description: "Yengil va kuchli MacBook Air.",
        price: 1300,
        imagUrll:
            "https://hiraoka.com.pe/media/mageplaza/blog/post/m/a/macbook_air_vs._macbook_pro-_cuales_son_sus_diferencias.jpg"),
    Product(
        id: "j4",
        title: "MacBook Pro 16 M1 Max",
        description: "Eng kuchli MacBook Pro M1 Max chipi bilan.",
        price: 2500,
        imagUrll:
            "https://paulov.ru/files/2012/09/apple-macbook-pro-17-inch-unibody-front1.jpg"),
  ];

  // Product get qilib oldik
  List<Product> get list {
    return [..._list];
  }

  void addProduct() {
   // _list.add(value);
    // Uzgarish bulasa  
    // notifyListeners(); malum qiladi 
    notifyListeners();
  }
}
