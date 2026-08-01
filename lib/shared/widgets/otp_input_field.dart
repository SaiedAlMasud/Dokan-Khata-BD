import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputField extends StatefulWidget {
  final int length;

  /// Called whenever OTP changes
  final ValueChanged<String>? onChanged;

  /// Called when all digits are entered
  final ValueChanged<String> onCompleted;

  const OtpInputField({
    super.key,
    this.length = 6,
    this.onChanged,
    required this.onCompleted,
  });

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();

    _controllers =
        List.generate(widget.length, (_) => TextEditingController());

    _focusNodes =
        List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }

    for (final node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  void _onChanged(String value, int index) {
    // Move to next field
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    // Move back when deleting
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp = _controllers.map((e) => e.text).join();

    // Notify parent whenever OTP changes
    widget.onChanged?.call(otp);

    // Notify when OTP is complete
    if (otp.length == widget.length) {
      widget.onCompleted(otp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.length, (index) {
        return SizedBox(
          width: 50,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counterText: "",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}