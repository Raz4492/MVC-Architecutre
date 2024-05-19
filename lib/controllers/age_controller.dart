import 'dart:async';
import '../models/age.dart';

class AgeController {
  Future<Age> fetchAge(String dob) async {
    // Simulating network delay
    await Future.delayed(Duration(seconds: 2));

    try {
      // Parse the provided date of birth
      DateTime birthDate = DateTime.parse(dob);
      DateTime today = DateTime.now();

      int years = today.year - birthDate.year;
      int months = today.month - birthDate.month;
      int days = today.day - birthDate.day;

      if (days < 0) {
        final previousMonth = today.month - 1;
        final daysInPreviousMonth =
            DateTime(today.year, previousMonth + 1, 0).day;
        days += daysInPreviousMonth;
        months -= 1;
      }

      if (months < 0) {
        months += 12;
        years -= 1;
      }

      return Age(years: years, months: months, days: days);
    } catch (e) {
      throw Exception('Failed to calculate age: Invalid date format');
    }
  }
}
