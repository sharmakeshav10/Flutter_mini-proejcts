import 'package:flutter/material.dart';
import 'package:shopping_app/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
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
          print(groceryItems);
        },
      ),
    );
  }
}
