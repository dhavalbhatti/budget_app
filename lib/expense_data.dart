import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

var formator = DateFormat('E, d/M/y');

enum Category {
  food,
  bills,
  clothing,
  entertainment,
  travel,
  others,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.bills: Icons.receipt,
  Category.clothing: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.travel: Icons.flight,
  Category.others: Icons.attach_money,
};

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

  String get formattedDate => formator.format(date);
}
