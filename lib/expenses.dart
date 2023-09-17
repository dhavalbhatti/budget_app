import 'package:budget_app/expense_data.dart';
import 'package:budget_app/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<ExpenseData> _expenses = [
    ExpenseData(
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
      category: Category.clothing,
    ),
    ExpenseData(
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
      category: Category.food,
    ),
    ExpenseData(
      title: 'Movie Tickets',
      amount: 89.99,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
    ExpenseData(
      title: 'Electricity Bill',
      amount: 1606.53,
      date: DateTime.now(),
      category: Category.bills,
    ),
    ExpenseData(
      title: 'Ring',
      amount: 690.99,
      date: DateTime.now(),
      category: Category.others,
    ),
    ExpenseData(
      title: 'Airplane Ticket',
      amount: 390.79,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('budget app'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Column(
          children: [
            Text('Chart'),
            Expanded(
              child: ExpensesList(expenses: _expenses),
            ),
          ],
        ),
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
