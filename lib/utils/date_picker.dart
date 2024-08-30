import 'package:flutter/material.dart';
import 'package:stryde_guest_app/theme/palette.dart';

Future<void> pickDateRange(BuildContext context) async {
    final newDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
      helpText: 'Select Range',
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: Palette.strydeOrange
            ),
          ),
          child: child!,
        );
      },
    );
    if (newDateRange != null) {
      
    }
  }