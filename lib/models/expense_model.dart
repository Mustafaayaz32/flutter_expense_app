import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

enum Category { food, travel, leisure, work }

class ExpenseModel {
  ExpenseModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = const Uuid().v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String getFormattedDate() {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  Map<Category, Icon> getIconMap() {
    Map<Category, Icon> iconMap = {
      Category.food: const Icon(Icons.food_bank),
      Category.travel: const Icon(Icons.travel_explore),
      Category.leisure: const Icon(Icons.party_mode),
      Category.work: const Icon(Icons.work),
    };

    return iconMap;
  }
}
