
import 'package:flutter/material.dart';
import 'package:major_project/screens/product_list.dart';

class CategoriesTab extends StatefulWidget {
  const CategoriesTab({Key? key}) : super(key: key);

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionTile(
          title: const Text('Men'),
          //subtitle: const Text('Custom expansion arrow icon'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          children: <Widget>[
                 InkWell(
              child: const ListTile(
                title: Text('TopWear'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
                 InkWell(
              child: const ListTile(
                title: Text('BottomWear'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
                 InkWell(
              child: const ListTile(
                title: Text('Shoes'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ),
        const Divider(),
        ExpansionTile(
          title: const Text('Women'),
          //subtitle: const Text('Custom expansion arrow icon'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          children:  <Widget>[
                InkWell(
              child: const ListTile(
                title: Text('BottomWear'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),     InkWell(
              child: const ListTile(
                title: Text('TopWear'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),     InkWell(
              child: const ListTile(
                title: Text('Shoes'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ),
        const Divider(),
        ExpansionTile(
          title: const Text('Kids'),
          //subtitle: const Text('Custom expansion arrow icon'),
          trailing: Icon(
            _customTileExpanded
                ? Icons.arrow_drop_down_circle
                : Icons.arrow_drop_down,
          ),
          children:  <Widget>[
                 InkWell(
              child: const ListTile(
                title: Text('TopWear'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
            InkWell(
              child: const ListTile(
                title: Text('BottomWear'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
                InkWell(
              child: const ListTile(
                title: Text('Shoes'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductList()));
              },
            ),
          ],
          onExpansionChanged: (bool expanded) {
            setState(() => _customTileExpanded = expanded);
          },
        ),
        const Divider(),
      ],
    );
  }
}
