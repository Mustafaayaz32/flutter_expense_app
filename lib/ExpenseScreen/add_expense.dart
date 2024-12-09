import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/expense_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key, required this.addNewExpense});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();

  final void Function(ExpenseModel expense) addNewExpense;
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late TextEditingController _expenseNameController;
  late TextEditingController _expenseAmountController;
  String? selectedDate;
  Category _selectedCategory = Category.food;

  void _saveExpense() {
    String title = _expenseNameController.text.trim();
    double? amount = double.tryParse(_expenseAmountController.text.trim());
    DateTime? date = selectedDate != null
        ? DateFormat('dd/MM/yyyy').parse(selectedDate!)
        : null;

    if (title.isEmpty || amount == null || amount < 0 || date == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Invalid Input'),
                content: const Text(
                    'Please check the input fields to add a new expense.'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text('Okay'))
                ],
              ));
      return;
    }

    ExpenseModel expense = ExpenseModel(
        title: title, amount: amount, date: date, category: _selectedCategory);
    widget.addNewExpense(expense);
    Navigator.pop(context, expense);
  }

  @override
  void initState() {
    super.initState();
    _expenseNameController = TextEditingController();
    _expenseAmountController = TextEditingController();
  }

  @override
  void dispose() {
    _expenseNameController.dispose();
    _expenseAmountController.dispose();
    super.dispose();
  }

  void _selectDate() async {
    var date = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 365)),
        initialDate: DateTime.now(),
        lastDate: DateTime.now());

    setState(() {
      selectedDate = DateFormat('dd/MM/yyyy').format(date!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text(
            'Add a new Expense',
            style: GoogleFonts.openSans(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextField(
            controller: _expenseNameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _expenseAmountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text('Amount'),
                    prefixText: '\$',
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate == null ? 'No date selected' : selectedDate!,
                    ),
                    IconButton(
                      onPressed: _selectDate,
                      icon: const Icon(Icons.date_range),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toUpperCase(),
                            style: GoogleFonts.openSans(
                                color: Colors.black, fontSize: 14),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    if (value == null) {
                      return;
                    }
                    _selectedCategory = value;
                  });
                },

                underline: Container(
                  height: 2,
                  color:
                      Theme.of(context).colorScheme.primary, // Underline color
                ), // Background color of the dropdown
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _saveExpense,
                child: const Text('Save'),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
