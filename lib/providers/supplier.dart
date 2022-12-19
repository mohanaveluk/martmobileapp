import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as _http;
//import 'dart:convert';

class Supplier with ChangeNotifier {
  int id = 0;
  String? name = '';
  String? description = '';
  String? logo_path = '';
  String? customer_email = '';
  bool is_paid_member = false;
  bool is_verified = false;
  bool is_trusted = false;

  Supplier({
    required this.id,
    required this.name,
    required this.description,
    required this.logo_path,
    required this.customer_email,
    required this.is_paid_member,
    required this.is_verified,
    required this.is_trusted,
  });
}
