import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/supplier_detail.dart';
import '../providers/supplier.dart';

class SupplierItem extends StatelessWidget {
  // final int id;
  // final String name;
  // final String description;
  // final String logoPath;

  // const SupplierItem(this.id, this.name, this.description, this.logoPath,
  //     {super.key});

  @override
  Widget build(BuildContext context) {
    final supplier = Provider.of<Supplier>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
            backgroundColor: Colors.black54,
            leading: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary),
            trailing: IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Theme.of(context).colorScheme.secondary),
            title: Text(
              supplier.name!,
              textAlign: TextAlign.center,
            )),
        child: GestureDetector(
          onTap: () {
            //Navigator.of(context).push(MaterialPageRoute(
            //    builder: (ctx) => const SupplierDetailScreen('some')));
            Navigator.of(context).pushNamed(SupplierDetailScreen.routeName,
                arguments: supplier.id);
          },
          child: Image.network(
            supplier.logo_path!,
          ),
        ),
      ),
    );
  }
}
