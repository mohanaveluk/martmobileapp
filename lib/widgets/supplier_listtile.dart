import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SupplierListTile extends StatefulWidget {
  const SupplierListTile({super.key});

  @override
  State<SupplierListTile> createState() => _SupplierListTileState();
}

class _SupplierListTileState extends State<SupplierListTile> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(child: ListTile(title: Text('One-line ListTile'))),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: FlutterLogo(size: 56.0),
                title: Text('Two-line ListTile'),
                subtitle: Text('Here is a second line'),
                trailing: IconButton(
                  icon: Icon(Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _expanded = !_expanded;
                    });
                  },
                ),
              ),
              if (_expanded)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                  height: 50,
                  child: const Text('Some information'),
                )
            ],
          ),
        ),
      ],
    );
    /*
    return Card(
      margin: const EdgeInsets.all(10),
      // shape: RoundedRectangleBorder(
      //   side: const BorderSide(
      //     color: Color.fromARGB(255, 212, 212, 212),
      //     width: 5, //<-- SEE HERE
      //   ),
      //   borderRadius: BorderRadius.circular(20.0),
      // ),
      elevation: 2,
      child: Column(
        children: [
          ListTile(
            title: const Text('Saravana Stores'),
            subtitle: const Text('Chennai branch'),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              height: 50,
              child: const Text('Some information'),
            )
        ],
      ),
    );
    */
  }
}
