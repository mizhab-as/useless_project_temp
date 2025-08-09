import 'package:flutter/material.dart';

import 'package:lasttry/core/app_theme.dart' as app_theme;
import 'package:lasttry/presentation/widgets/cyber_button.dart';

class ResultCard extends StatelessWidget {
  final String name;
  final String result;
  final String emoji;
  final VoidCallback onConvertAgain;
  final List<Map<String, String>> extraFields; // New field

  const ResultCard({
    super.key,
    required this.name,
    required this.result,
    required this.emoji,
    required this.onConvertAgain,
    this.extraFields = const [], // Default empty
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              name.isEmpty ? 'YOUR HEIGHT IS' : name.toUpperCase(),
              style: TextStyle(
                color: app_theme.CyberColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              result,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 28,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              emoji,
              style: const TextStyle(fontSize: 60),
            ),
            const SizedBox(height: 16),
            ...extraFields.map((field) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        field['label'] ?? '',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(field['value'] ?? ''),
                    ],
                  ),
                )),
            const SizedBox(height: 24),
            CyberButton(
              onPressed: onConvertAgain,
              child: const Text('CONVERT AGAIN'),
            ),
          ],
        ),
      ),
    );
  }
}