import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HelperFunction {
  static String formatTzPhone(String input) {
    String phone = input.trim();

    if (phone.startsWith('0')) {
      return '255${phone.substring(1)}';
    }

    if (phone.startsWith('+255')) {
      return phone.replaceFirst('+', '');
    }

    return phone;
  }

  static String formatPrettyDate(String? date) {
    if (date == null || date.isEmpty) return "--";

    try {
      final parsed = DateTime.parse(date);
      return "${parsed.day} ${monthName(parsed.month)}, ${parsed.year}";
    } catch (e) {
      return "--";
    }
  }

  /// Format ISO date string to: 10 Jan, 2025 • 14:30
  static String formatPrettyDateTime(String? date) {
    if (date == null || date.isEmpty) return "--";

    try {
      final parsed = DateTime.parse(date);
      final hour = parsed.hour.toString().padLeft(2, '0');
      final minute = parsed.minute.toString().padLeft(2, '0');

      return "${parsed.day} ${monthName(parsed.month)}, ${parsed.year} • $hour:$minute";
    } catch (e) {
      return "--";
    }
  }

  /// Get month short name
  static String monthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return months[(month - 1).clamp(0, 11)];
  }

  static String formatCurrency(
    num? amount, {
    String currency = "TZS",
    int decimalDigits = 2,
  }) {
    if (amount == null) return "$currency 0.00";

    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: "$currency ",
      decimalDigits: decimalDigits,
    );

    return formatter.format(amount);
  }

  /// Example: 1500000 -> TZS 1.5M
  static String formatMoneyCompact(num? amount, {String currency = "TZS"}) {
    if (amount == null) return "$currency 0";

    final formatter = NumberFormat.compactCurrency(
      locale: 'en_US',
      symbol: "$currency ",
    );

    return formatter.format(amount);
  }

  static Color bgColor(String status, BuildContext context) {
    final theme = Theme.of(context);

    switch (status.toUpperCase()) {
      case "PAID":
      case "SUCCESS":
        return Colors.green.withValues(alpha: 0.12);
      case "PENDING":
        return Colors.orange.withValues(alpha: 0.15);
      case "FAILED":
        return Colors.red.withValues(alpha: 0.15);
      default:
        return theme.colorScheme.primary.withValues(alpha: 0.12);
    }
  }

  static Color textColor(String status) {
    switch (status.toUpperCase()) {
      case "PAID":
      case "SUCCESS":
        return Colors.green;
      case "PENDING":
        return Colors.orange;
      case "FAILED":
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }

  static Map<DateTime, double> groupContributionsPerDay(
    List<dynamic> contributions,
  ) {
    final Map<DateTime, double> grouped = {};

    for (final item in contributions) {
      final date = DateTime.parse(item['createdDate']);

      // Normalize to date-only (remove time)
      final day = DateTime(date.year, date.month, date.day);

      final amount = (item['amount'] as num).toDouble();

      grouped.update(
        day,
        (existing) => existing + amount,
        ifAbsent: () => amount,
      );
    }

    final sortedKeys = grouped.keys.toList()..sort();

    return {for (final key in sortedKeys) key: grouped[key]!};
  }

  static String getInitials(String name) {
    if (name.isEmpty) return "U";
    final parts = name.split(" ");
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return (parts.first[0] + parts.last[0]).toUpperCase();
  }

  static String formatJoinedDate(String? date) {
    if (date == null || date.isEmpty) return "N/A";
    try {
      final parsed = DateTime.parse(date);
      return "${parsed.day}/${parsed.month}/${parsed.year}";
    } catch (e) {
      return "N/A";
    }
  }
}
