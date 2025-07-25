import 'package:flutter/material.dart';

class InstructionSteps extends StatelessWidget {
  final List<String> steps;

  const InstructionSteps({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        steps.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${index + 1}. ', style: const TextStyle(fontWeight: FontWeight.bold)),
              Expanded(child: Text(steps[index])),
            ],
          ),
        ),
      ),
    );
  }
}
