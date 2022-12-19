import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suppliers.dart';
import '../widgets/supplier_grid.dart';
import '../widgets/supplier_listtile.dart';
import '../widgets/supplier_table.dart';

class SupplierOverview extends StatefulWidget {
  const SupplierOverview({super.key});

  @override
  State<SupplierOverview> createState() => _SupplierOverviewState();
}

class _SupplierOverviewState extends State<SupplierOverview> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    //final suppliers = Provider.of<Suppliers>(context).fetchSuppliers();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _isLoading = true;
    });
    if (_isInit) {
      Provider.of<Suppliers>(context, listen: false).fetchSuppliers().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
      _isInit = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suppliers')),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          // : SupplierListTile(), //SupplierTable(), //SupplierGrid(),
          : SupplierGrid(), //SupplierTable(), //SupplierGrid(),
    );
  }
}
