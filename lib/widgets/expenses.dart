import 'package:expenses_project/widgets/chart/chart.dart';
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
  List<Expense> registeredExpenses = [
    Expense(
        category: Category.work,
        title: "Flutter Project",
        amount: 19.9,
        date: DateTime.now()),
    Expense(
        category: Category.food,
        title: "Pizza Burger",
        amount: 999,
        date: DateTime.now()),
    Expense(
        category: Category.leisure,
        title: "Cinema",
        amount: 99,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        title: "Flutter Travel",
        amount: 5427,
        date: DateTime.now()),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
          margin: const EdgeInsets.symmetric(vertical: 32),
          child: NewExpense(onAddExpense: _addExpense)),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense Deleted"),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =
        const Center(child: Text("No expenses found.Start adding some!"));

    if (registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpenseTracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Chart(expenses: registeredExpenses),
            Expanded(child: mainContent)
          ],
        ),
      ),
    );
  }
}
