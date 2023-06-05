import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid= Uuid();

enum Category {food, travel ,leisure,work}

final formatter=DateFormat.yMd();

const categoryIcon={
  Category.food: Icons.lunch_dining,
  Category.travel : Icons.flight,
  Category.leisure: Icons.movie_creation_outlined,
  Category.work:Icons.work,
};
class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {
      required this.category,
      required this.title,
      required this.amount,
      required this.date}):id=uuid .v4();


  get formattedDate{
    return formatter.format(date);
  }
}
