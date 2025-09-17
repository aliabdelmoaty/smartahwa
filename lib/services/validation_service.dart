/// Service class responsible for validation logic
/// Follows Single Responsibility Principle - only handles validation
class ValidationService {
  static String? validateCustomerName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Customer name is required';
    }
    if (value.trim().length < 2) {
      return 'Customer name must be at least 2 characters';
    }
    if (value.trim().length > 50) {
      return 'Customer name must be less than 50 characters';
    }
    return null;
  }

  static String? validateSpecialInstructions(String? value) {
    if (value != null && value.trim().length > 200) {
      return 'Special instructions must be less than 200 characters';
    }
    return null;
  }

  static bool isValidOrder({
    required String customerName,
    required String specialInstructions,
  }) {
    return validateCustomerName(customerName) == null &&
        validateSpecialInstructions(specialInstructions) == null;
  }
}
