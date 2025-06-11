import 'package:flutter/material.dart';

class StatusMessage extends StatelessWidget {
  final String message;
  final Color color;

  const StatusMessage({Key? key, required this.message, required this.color})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message.isEmpty) {
      return SizedBox.shrink();
    }

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        message,
        style: TextStyle(color: color, fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
