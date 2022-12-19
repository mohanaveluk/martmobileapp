import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as _http;

import 'supplier.dart';

class Suppliers extends ChangeNotifier {
  List<Supplier> _items = [
    Supplier(
        id: 1,
        name: "someone1",
        description: "someone11",
        logo_path:
            "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-High-Quality-Image.png",
        customer_email: "",
        is_paid_member: false,
        is_verified: false,
        is_trusted: false),
    Supplier(
        id: 2,
        name: "someone2",
        description: "someone12",
        logo_path:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/User_icon-cp.svg/1200px-User_icon-cp.svg.png",
        customer_email: "",
        is_paid_member: false,
        is_verified: false,
        is_trusted: false),
  ];

  List<Supplier> get items {
    return [..._items];
  }

  Future<void> fetchSuppliers() async {
    final headers = {'Content-Type': 'application/json'};
    final encoding = Encoding.getByName('utf-8');
    final url = Uri.parse(
        'https://worldmart-api-hqhsvwro4a-uc.a.run.app/api/v1/customer/retrieve?id=0&reload=1');
    try {
      final response = await _http.get(url);
      final decodedResponse = json.decode(response.body);
      final List<Supplier> loadedSuppliers = [];
      if (decodedResponse['status'] == 'true') {
        final extractedProducts = decodedResponse['customer'];
        for (var i = 0; i < extractedProducts.length; i++) {
          final supplierData = extractedProducts[i];
          print(supplierData);
          loadedSuppliers.add(Supplier(
            id: int.parse(supplierData['id'].toString()),
            name: supplierData['name'],
            description: supplierData['description'],
            logo_path: supplierData['logo_path'] != null &&
                    supplierData['logo_path']?.contains('http')
                ? supplierData['logo_path']
                : 'https://www.ov-salvo.nl/wp-content/uploads/2016/01/logo-placeholder.jpg',
            customer_email: supplierData['customer_email'],
            is_paid_member: supplierData['is_paid_member'] == 1 ? true : false,
            is_verified: supplierData['is_verified'] == 1 ? true : false,
            is_trusted: supplierData['is_trusted'] == 1 ? true : false,
          ));
        }
      }
      _items = loadedSuppliers;
      notifyListeners();
    } catch (e) {
      print(e);
      //rethrow;
    }
  }

  Supplier findById(String id) {
    return _items.firstWhere((element) => element.id == int.parse(id));
  }

  void addSupplier(value) {
    //_items.add(value);
    notifyListeners();
  }
}
