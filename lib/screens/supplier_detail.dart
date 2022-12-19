import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/supplier.dart';
import '../providers/suppliers.dart';

class SupplierDetailScreen extends StatelessWidget {
  //final String name;
  static const routeName = '/supplier-detail';

  const SupplierDetailScreen({super.key});

  //const SupplierDetailScreen(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    final supplierId = ModalRoute.of(context)!.settings.arguments; // as int;
    final loadedSupplier = Provider.of<Suppliers>(context, listen: false)
        .findById(supplierId.toString());

    return Scaffold(appBar: AppBar(title: Text(loadedSupplier.name!)));
  }
}
