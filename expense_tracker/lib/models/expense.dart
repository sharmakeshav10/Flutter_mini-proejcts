import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

//formatter to format date
final formatter = DateFormat.yMd();

//generated a unique id
const uuid = Uuid();

//enum which allows us to add all these as Category custom type
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.dinner_dining,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
