import 'package:flutter/material.dart';
import 'package:flutter_expense_app/models/expense_model.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList(
      {super.key,
      required this.expensesDataList,
      required this.removeDataFromList});

  final List<ExpenseModel> expensesDataList;
  final void Function(ExpenseModel) removeDataFromList;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Dismissible(
            background: Container(
              color: Colors.red,
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
            key: ValueKey(widget.expensesDataList[index]),
            onDismissed: (direction) {
              widget.removeDataFromList(widget.expensesDataList[index]);
            },
            child: Card(
              elevation: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Column(
                  children: [
                    Text(widget.expensesDataList[index].title),
                    Text(widget.expensesDataList[index].category.name
                        .toUpperCase()),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                            '\$${widget.expensesDataList[index].amount.toStringAsFixed(2)}'),
                        Spacer(),
                        Row(
                          children: <Widget>[
                            Icon(widget.expensesDataList[index]
                                .getIconMap()[
                                    widget.expensesDataList[index].category]!
                                .icon),
                            Text(widget.expensesDataList[index]
                                .getFormattedDate()),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
      itemCount: widget.expensesDataList.length,
    );
  }
}
