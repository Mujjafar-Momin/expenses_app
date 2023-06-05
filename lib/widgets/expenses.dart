import 'package:expenses_project/widgets/expenses_list/expenses_list.dart';
import 'package:expenses_project/models/expense.dart';
import 'package:expenses_project/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense>  registeredExpenses=[
    Expense(category: Category.work, title: "Flutter Project", amount: 19.9, date: DateTime.now()),
    Expense(category: Category.food, title: "Pizza Burger", amount: 999, date: DateTime.now()),
    Expense(category: Category.leisure, title: "Cinema", amount: 99, date: DateTime.now()),
    Expense(category: Category.travel, title: "Flutter Travel", amount: 5427, date: DateTime.now()),
  ];
void _openAddExpenseOverlay(){
  showModalBottomSheet(context: context, builder: (context)=>const NewExpense(),);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("The Chart"),
            Expanded(child: ExpensesList(expenses: registeredExpenses))
          ],
        ),
      ),
    );
  }
}
