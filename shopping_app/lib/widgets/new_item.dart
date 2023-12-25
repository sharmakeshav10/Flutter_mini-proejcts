import 'package:flutter/material.dart';
import 'package:shopping_app/data/categories.dart';

class NewItem extends StatelessWidget {
  const NewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text('name'),
              ),
              validator: (value) {
                return 'Validate';
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Quantity'),
                    ),
                    initialValue: '1',
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: DropdownButtonFormField(items: [
                    for (final category in categories.entries)
                      DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                width: 16,
                                height: 16,
                                color: category.value.color,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(category.value.title)
                            ],
                          ))
                  ], onChanged: (value) {}),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
