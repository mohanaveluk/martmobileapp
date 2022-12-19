import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/suppliers.dart';
import '../widgets/supplier_item.dart';

class SupplierTable extends StatefulWidget {
  const SupplierTable({super.key});

  @override
  State<SupplierTable> createState() => _SupplierTableState();
}

class _SupplierTableState extends State<SupplierTable> {
  @override
  Widget build(BuildContext context) {
    final double iconSize = 40;
    final supplierData = Provider.of<Suppliers>(context);
    final suppliers = supplierData.items;

    return ListView(
      children: [
        const Center(
          child: Text('People Chart',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              )),
        ),
        DataTable(
          columns: const [
            DataColumn(
              label: Text('Id',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            DataColumn(
              label: Text('Profession',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
          ],
          rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Stephen flemingo')),
              DataCell(Text('Actor')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Box Corroda')),
              DataCell(Text('Camera')),
            ]),
          ],
        )
      ],
    );

    /*
    return Center(
      child: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  Column(children: [
                    Icon(
                      Icons.account_box,
                      size: iconSize,
                    ),
                    Text('My Account')
                  ]),
                  Column(children: [
                    Icon(
                      Icons.settings,
                      size: iconSize,
                    ),
                    Text('Settings')
                  ]),
                  Column(children: [
                    Icon(
                      Icons.lightbulb_outline,
                      size: iconSize,
                    ),
                    Text('Ideas')
                  ]),
                ],
              ),
            ],
          ),
        ),
      ]),
    );
    */
  }
}
