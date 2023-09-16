import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  bills,
  clothing,
  entertainment,
  travel,
  others,
}

class ExpenseData {
  ExpenseData(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String title;
  final double amount;
  final DateTime date;
  final String id;
  final Category category;
}
