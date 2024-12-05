import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  late TextEditingController _expenseNameController;
  late TextEditingController _expenseAmountController;

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
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
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
          TextField(
            controller: _expenseAmountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              label: Text('Amount'),
              prefixText: '\$',
            ),
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
              ElevatedButton(onPressed: () {}, child: const Text('Save')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
            ],
          ),
        ],
      ),
    );
  }
}
