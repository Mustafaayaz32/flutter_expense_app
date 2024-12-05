import 'package:flutter_expense_app/models/expense_model.dart';

List<ExpenseModel> expenseData = [
  ExpenseModel(
    amount: 50.0,
    category: Category.food,
    date: DateTime.now(),
    title: 'Grocery shopping',
  ),
  ExpenseModel(
    amount: 30.0,
    category: Category.travel,
    date: DateTime.now().subtract(const Duration(days: 1)),
    title: 'Bus fare',
  ),
  ExpenseModel(
    amount: 20.0,
    category: Category.leisure,
    date: DateTime.now().subtract(const Duration(days: 2)),
    title: 'Movie ticket',
  ),
  ExpenseModel(
    amount: 10.0,
    category: Category.work,
    date: DateTime.now().subtract(const Duration(days: 3)),
    title: 'Coffee break',
  ),
  ExpenseModel(
    amount: 40.0,
    category: Category.food,
    date: DateTime.now().subtract(const Duration(days: 4)),
    title: 'Dinner',
  ),
  ExpenseModel(
    amount: 35.0,
    category: Category.travel,
    date: DateTime.now().subtract(const Duration(days: 5)),
    title: 'Taxi fare',
  ),
  ExpenseModel(
    amount: 25.0,
    category: Category.leisure,
    date: DateTime.now().subtract(const Duration(days: 6)),
    title: 'Book',
  ),
  ExpenseModel(
    amount: 15.0,
    category: Category.work,
    date: DateTime.now().subtract(const Duration(days: 7)),
    title: 'Lunch',
  ),
  ExpenseModel(
    amount: 45.0,
    category: Category.food,
    date: DateTime.now().subtract(const Duration(days: 8)),
    title: 'Breakfast',
  ),
];
