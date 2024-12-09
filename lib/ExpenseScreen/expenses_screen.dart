import 'package:flutter/material.dart';
import 'package:flutter_expense_app/ExpenseScreen/add_expense.dart';
import 'package:flutter_expense_app/ExpenseScreen/expenses_list_screen.dart';
import 'package:flutter_expense_app/chart/chart.dart';
import 'package:flutter_expense_app/data/expense_data.dart';
import 'package:flutter_expense_app/models/expense_model.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  final List<ExpenseModel> _expenses = expenseData;

  void _addNewExpense(ExpenseModel expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    setState(() {
      var removedExpenseIndex = _expenses.indexOf(expense);
      _expenses.remove(expense);
      ScaffoldMessenger.of(context).removeCurrentSnackBar();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Are you sure to delete? ${expense.title}'),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _expenses.insert(removedExpenseIndex, expense);
              });
            },
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense App'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  useSafeArea: true,
                  isScrollControlled: true,
                  builder: (ctx) =>
                      AddExpenseScreen(addNewExpense: _addNewExpense));
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Chart(expenses: _expenses),
          const Text('Expense Details'),
          Expanded(
            child: ExpensesList(
                expensesDataList: _expenses,
                removeDataFromList: _removeExpense),
          ),
        ],
      ),
    );
  }
}
