import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_items.dart';
import 'package:shopping_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({
    super.key,
  });

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void addItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => NewItem(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: addItem,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 26,
              height: 26,
              color: groceryItems[index].category.color,
            ),
            title: Text(groceryItems[index].name),
            trailing: Text(groceryItems[index].quantity.toString()),
          );
        },
      ),
    );
  }
}
