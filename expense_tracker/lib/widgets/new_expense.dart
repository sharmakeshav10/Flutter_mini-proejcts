import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  //to get the user input value from onChange
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  void presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
              maxLength: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      prefixText: '₹ ',
                      label: Text('Amount'),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(selectedDate == null
                          ? 'No date seleted'
                          : formatter.format(selectedDate!)),
                      IconButton(
                        onPressed: presentDatePicker,
                        icon: const Icon(Icons.calendar_month),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButton(
                    value: selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (val) => setState(() {
                          selectedCategory = val!;
                        })),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                  },
                  child: Text('Save Expense'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel'),
                )
              ],
            )
          ],
        ));
  }
}
