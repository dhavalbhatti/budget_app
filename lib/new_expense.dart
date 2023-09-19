import 'package:flutter/material.dart';
import 'expense_data.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _textStoring = '';
  double _amountStoring = 0.0;
  DateTime? _dateStoring;
  Category _categoryStoring = Category.food;

  void _textChangeHandler(String inputtext) {
    _textStoring = inputtext;
  }

  void _amountChangeHandler(String inputamount) {
    _amountStoring = double.parse(inputamount);
  }

  void _dateChangeHandler() async {
    final initialDate = DateTime.now();
    final firstDate = DateTime(2022);
    final lastDate = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _dateStoring = pickedDate;
    });
  }

  void _submitDataCheck() {
    if (_textStoring.trim().isEmpty ||
        _amountStoring <= 0 ||
        _amountStoring == null ||
        _dateStoring == null) {
      print('invalid input');
    } else {
      print(_textStoring);
      print(_amountStoring);
      print(_categoryStoring);
      print(formator.format(_dateStoring!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
            onChanged: _textChangeHandler,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '₹ ',
                    labelText: 'Amount',
                  ),
                  onChanged: _amountChangeHandler,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _dateStoring == null
                          ? 'No Date Chosen!'
                          : formator.format(_dateStoring!),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: _dateChangeHandler,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                value: _categoryStoring,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _categoryStoring = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: _submitDataCheck,
                child: const Text('Add Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
