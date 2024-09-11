import 'package:flutter/material.dart';

class GameButton extends StatelessWidget {
  final String choice;
  final VoidCallback? onPressed;
  final bool isDisabled;

  const GameButton({
    required this.choice,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade300,
          shape: CircleBorder(),
          padding: EdgeInsets.all(24),
        ),
        child: Text(choice),
      ),
    );
  }
}