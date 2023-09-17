import 'package:flutter/material.dart';
import 'expense_data.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard(this.expenses, {super.key});

  final ExpenseData expenses;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Text(expenses.title),
            Row(
              children: [
                Text('\$ ${expenses.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Text(
                  formator.format(expenses.date),
                ),
                const SizedBox(
                  width: 10,
                ),
                Icon(categoryIcons[expenses.category]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
