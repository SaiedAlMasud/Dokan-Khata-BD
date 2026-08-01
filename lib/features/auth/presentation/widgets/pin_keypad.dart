import 'package:flutter/material.dart';

class PinKeypad extends StatelessWidget {
  final ValueChanged<String> onNumberPressed;
  final VoidCallback onBackspace;

  const PinKeypad({
    super.key,
    required this.onNumberPressed,
    required this.onBackspace,
  });

  Widget _buildButton({
    required Widget child,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 80,
      height: 80,
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onTap,
        child: Center(child: child),
      ),
    );
  }

  Widget _numberButton(String number) {
    return _buildButton(
      onTap: () => onNumberPressed(number),
      child: Text(
        number,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _backspaceButton() {
    return _buildButton(
      onTap: onBackspace,
      child: const Icon(
        Icons.backspace_outlined,
        size: 30,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _numberButton("1"),
            _numberButton("2"),
            _numberButton("3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _numberButton("4"),
            _numberButton("5"),
            _numberButton("6"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _numberButton("7"),
            _numberButton("8"),
            _numberButton("9"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 80),
            _numberButton("0"),
            _backspaceButton(),
          ],
        ),
      ],
    );
  }
}