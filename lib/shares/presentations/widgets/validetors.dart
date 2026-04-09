
class Validetors {
  static final RegExp _emilRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  String? validateNullorEmpty(String? value, String invalidMessage) {
    if (value == null || value.isEmpty) {
      return invalidMessage;
    } else {
      return null;
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty || !_emilRegExp.hasMatch(value)) {
      return 'Please Enter Valid Email';
    } else {
      return null;
    }
  }

  String? Validpassword(String? value) {
    if (value == null || value.isEmpty || value.length < 6) {
      return 'Please must be at least 6 characters';
    } else {
      return null;
    }
  }

  String? validMobileNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a valid mobile number';
    }

    // Must be exactly 11 digits
    if (value.length != 11) {
      return 'Mobile number must be exactly 11 digits';
    }

    // Must contain only numbers
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Only digits are allowed';
    }

    // Bangladesh number format check (01XXXXXXXXX)
    if (!RegExp(r'^01[3-9][0-9]{8}$').hasMatch(value)) {
      return 'Enter a valid Bangladeshi mobile number';
    }

    return null;
  }
}
