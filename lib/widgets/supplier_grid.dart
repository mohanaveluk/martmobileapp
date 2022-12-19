import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suppliers.dart';
import '../widgets/supplier_item.dart';

class SupplierGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final supplierData = Provider.of<Suppliers>(context);
    final suppliers = supplierData.items;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: suppliers[i],
              child: SupplierItem(
                  // suppliers[i].id,
                  // suppliers[i].name!,
                  // suppliers[i].description!,
                  // suppliers[i].logo_path!,
                  ),
            ),
        itemCount: suppliers.length,
        padding: const EdgeInsets.all(10));
  }
}
