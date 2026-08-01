import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInputFieldController {
  _OtpInputFieldState? _state;

  void clear() {
    _state?.clear();
  }

  void requestFocus() {
    _state?.requestFocus();
  }
}

class OtpInputField extends StatefulWidget {
  final int length;

  final OtpInputFieldController? controller;

  /// Called whenever OTP changes
  final ValueChanged<String>? onChanged;

  /// Called when all digits are entered
  final ValueChanged<String> onCompleted;

  const OtpInputField({
    super.key,
    this.length = 6,
    this.controller,
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
  void _fillOtp(String otp) {
    if (otp.length != widget.length) return;

    for (int i = 0; i < widget.length; i++) {
      _controllers[i].text = otp[i];
    }

    _focusNodes.last.unfocus();

    widget.onChanged?.call(otp);
    widget.onCompleted(otp);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    widget.controller?._state = this;

    _controllers =
        List.generate(widget.length, (_) => TextEditingController());

    _focusNodes =
        List.generate(widget.length, (_) => FocusNode());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes.first.requestFocus();
    });
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

  void clear() {
    for (final controller in _controllers) {
      controller.clear();
    }

    widget.onChanged?.call("");
  }

  void requestFocus() {
    _focusNodes.first.requestFocus();
  }

  void _onChanged(String value, int index) {
    // User pasted entire OTP
    if (value.length == widget.length) {
      _fillOtp(value);
      return;
    }

    // Move to next field
    if (value.isNotEmpty && index < widget.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    // Move back
    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    final otp = _controllers.map((e) => e.text).join();

    widget.onChanged?.call(otp);

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
            maxLength: widget.length,
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