class Validators {
  Validators._();

  static String? validateBangladeshPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }

    final phone = value.trim();

    final regex = RegExp(r'^01[3-9]\d{8}$');

    if (!regex.hasMatch(phone)) {
      return 'Enter a valid Bangladeshi mobile number';
    }

    return null;
  }

  static String? validateOtp(String otp) {
    if (otp.length != 6) {
      return 'OTP must be 6 digits';
    }

    return null;
  }

  static String? validatePin(String pin) {
    if (pin.length != 4) {
      return 'PIN must be 4 digits';
    }

    return null;
  }
}