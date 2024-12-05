import 'package:flutter/material.dart';
import 'package:flutter_expense_app/ExpenseScreen/add_expense.dart';
import 'package:flutter_expense_app/ExpenseScreen/expenses_list_screen.dart';
import 'package:flutter_expense_app/data/expense_data.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context, builder: (ctx) => const AddExpenseScreen());
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Expense Details'),
          Expanded(
            child: ExpensesList(
              expensesDataList: expenseData,
            ),
          ),
        ],
      ),
    );
  }
}
