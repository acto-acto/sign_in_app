import 'package:flutter/material.dart';

class StatusMessage extends StatelessWidget {
  final String message;
  final Color color;

  const StatusMessage({super.key, required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha((0.1 * 255).round()),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha((0.1 * 255).round())),
      ),
      child: Text(
        message,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
