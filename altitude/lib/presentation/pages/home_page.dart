import 'package:flutter/material.dart';
import 'dart:math';


// Mock heightUnits and widget classes for error-free compilation
class HeightUnit {
  final String name;
  final String emoji;
  final int length;
  
  HeightUnit({required this.name, required this.emoji, required this.length});
}

final List<HeightUnit> heightUnits = [
  HeightUnit(name: 'Banana', emoji: '🍌', length: 20),
  HeightUnit(name: 'Pencil', emoji: '✏️', length: 15),
  HeightUnit(name: 'Toothbrush', emoji: '🪥', length: 18),
  HeightUnit(name: 'Spoon', emoji: '🥄', length: 14),
  HeightUnit(name: 'Mountain', emoji: '⛰️', length: 884800), // Everest
  HeightUnit(name: 'Giraffe', emoji: '🦒', length: 550),
  HeightUnit(name: 'Toilet Paper Roll', emoji: '🧻', length: 10),
  HeightUnit(name: 'Tennis Racket', emoji: '🎾', length: 68),
  HeightUnit(name: 'Toothpick', emoji: '🦷', length: 6),
  HeightUnit(name: 'Twigs', emoji: '🌿', length: 12),
  HeightUnit(name: 'Rubber Duck', emoji: '🦆', length: 9),
  HeightUnit(name: 'Traffic Cone', emoji: '🚧', length: 70),
  HeightUnit(name: 'Shoe', emoji: '👟', length: 28),
  HeightUnit(name: 'Pizza Slice', emoji: '🍕', length: 12),
  HeightUnit(name: 'USB Stick', emoji: '💾', length: 5),
  HeightUnit(name: 'Toaster', emoji: '🍞', length: 18),
  HeightUnit(name: 'Lego Brick', emoji: '🧱', length: 3),
  HeightUnit(name: 'Toadstool', emoji: '🍄', length: 10),
  HeightUnit(name: 'Toilet', emoji: '🚽', length: 40),
  HeightUnit(name: 'Hotdog', emoji: '🌭', length: 15),
  HeightUnit(name: 'Saxophone', emoji: '🎷', length: 65),
  HeightUnit(name: 'Cucumber', emoji: '🥒', length: 25),
  HeightUnit(name: 'Toaster Strudel', emoji: '🥐', length: 11),
  HeightUnit(name: 'Garden Gnome', emoji: '🧙‍♂️', length: 30),
  HeightUnit(name: 'Tooth Fairy', emoji: '🧚‍♀️', length: 8),
];

class CyberInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final TextInputType? keyboardType;
  const CyberInput({
    required this.controller,
    required this.label,
    required this.icon,
    this.keyboardType,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      keyboardType: keyboardType,
    );
  }
}

class CyberButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const CyberButton({required this.onPressed, required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        side: const BorderSide(color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}

class ResultCard extends StatelessWidget {
  final String name;
  final List<String> results;
  final List<String> emojis;
  final VoidCallback onConvertAgain;
  const ResultCard({
    required this.name,
    required this.results,
    required this.emojis,
    required this.onConvertAgain,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Name: $name', style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 8),
            ...List.generate(results.length, (i) {
              return Row(
                children: [
                  Text(
                    '${emojis[i]} ${results[i]}',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              );
            }),
            const SizedBox(height: 12),
            TextButton(
              onPressed: onConvertAgain,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white),
              ),
              child: const Text('Convert Again'),
            ),
          ],
        ),
      ),
    );
  }
}

class UnitCard extends StatelessWidget {
  final HeightUnit unit;
  final bool selected;
  final VoidCallback onTap;
  const UnitCard({required this.unit, required this.selected, required this.onTap, super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: selected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: selected ? Colors.black : Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            '${unit.emoji} ${unit.name} (${unit.length}cm)',
            style: TextStyle(
              color: selected ? Colors.black : Colors.white,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  List<String> _results = [];
  List<String> _emojis = [];
  bool _showResult = false;

  void _convertHeight() {
    if (_heightController.text.isEmpty) return;
    final heightCm = double.tryParse(_heightController.text) ?? 0;
    if (heightUnits.isEmpty) return;
    final random = Random();
    // Pick 1 to 3 random units for absurdity
    final count = random.nextInt(3) + 1;
    final units = List<HeightUnit>.from(heightUnits)..shuffle(random);
    setState(() {
      _results = [];
      _emojis = [];
      for (int i = 0; i < count && i < units.length; i++) {
        final unit = units[i];
        final value = heightCm / unit.length;
        _results.add('${value.toStringAsFixed(1)} ${unit.name}');
        _emojis.add(unit.emoji);
      }
      _showResult = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Column(
              children: [
                Text(
                  'ALTITUDE',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Convert your biometrics to absurd units',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white70,
                      ),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Input Section
            CyberInput(
              controller: _nameController,
              label: 'IDENTITY',
              icon: Icons.fingerprint,
            ),
            const SizedBox(height: 20),
            CyberInput(
              controller: _heightController,
              label: 'HEIGHT (CM)',
              icon: Icons.straighten,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),

            // Convert Button
            CyberButton(
              onPressed: _convertHeight,
              child: const Text('PROCESS DATA'),
            ),
            const SizedBox(height: 40),

            // Result Section
            if (_showResult)
              ResultCard(
                name: _nameController.text,
                results: _results,
                emojis: _emojis,
                onConvertAgain: () => setState(() => _showResult = false),
              ),

            // Unit Gallery
            const SizedBox(height: 40),
            Text(
              'CONVERSION UNITS',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: 24,
                    color: Colors.white,
                  ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.6,
              ),
              itemCount: heightUnits.length,
              itemBuilder: (context, index) {
                final unit = heightUnits[index];
                return Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '${unit.emoji} ${unit.name} (${unit.length}cm)',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
