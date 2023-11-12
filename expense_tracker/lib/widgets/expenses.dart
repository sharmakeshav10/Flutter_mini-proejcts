import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Nike shoes',
        amount: 7950,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Goa Tour',
        amount: 15000,
        date: DateTime.now(),
        category: Category.travel),
  ];

  void _openModalSheetOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: addExpense),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openModalSheetOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Center(
        child: Column(children: [
          const Text('Chart'),
          Expanded(
              child: ExpensesList(
            expenses: _registeredExpenses,
            onRemoveExpense: removeExpense,
          ))
        ]),
      ),
    );
  }
}
