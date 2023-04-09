class FieldValidator {
  static String? emailValidator(String? val) {
    if (val!.isEmpty) return "Required";
    RegExp emailRegex = RegExp(
        r"^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$");

    return emailRegex.hasMatch(val) ? null : "Invalid Email!";
  }

  static String? passwordValidator(String? password) {
    if (password!.isEmpty) return "Required";
    if (password.length < 8) {
      return "Required 8 or more than 8 letter password";
    }

    // Check if password contains at least one uppercase letter
    if (password.toUpperCase() == password) {
      return "At least one lower case character required";
    }

    // Check if password contains at least one lowercase letter
    if (password.toLowerCase() == password) {
      return "At least one upper case character required";
    }

    // Check if password contains at least one digit
    if (!password.contains(RegExp(r'\d'))) {
      return "At least one digit required";
    }

    // Check if password contains at least one special character
    if (!password.contains(RegExp(r'[!@#\$%\^&\*()_\+\-\={}<>\?,\.\/~`|\\]'))) {
      return "At least one special character required";
    }

    return null;
  }

  static String? numberValidator(String? val) {
    if (val!.isEmpty) return "Required";
    RegExp phoneRegex = RegExp(r'^[6-9]\d{9}$');

    return phoneRegex.hasMatch(val) ? null : "Please enter valid number";
  }

  static String? nameValidator(String? name) {
    if (name!.isEmpty) return "Required";
    if (name.split(" ").length == 1) return "Enter Name and Surname";
    RegExp nameRegex = RegExp(r'^[a-zA-Z\s]+$');

    return nameRegex.hasMatch(name) ? null : "Invalid Name";
  }
}
