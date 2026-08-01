class ShopValidators {
  ShopValidators._();

  static String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }

    return null;
  }
}