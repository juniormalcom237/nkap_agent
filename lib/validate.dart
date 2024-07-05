import 'package:get/get.dart';

class Validator {
  static String? validateEmail(String value) {
    Pattern pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return "Enter a valid mail address.".tr;
    } else {
      return null;
    }
  }

  static String? validateMatch(String first, second) {
    if (first != second) {
      return "inputNotMatch".tr;
    } else {
      return null;
    }
  }

  static String? validatePINMatch(String first, String second) {
    if (first != second || first.length < 5 || second.length < 5) {
      return "inputPINNotMatch".tr;
    } else {
      return null;
    }
  }

  static String? validateNoMatch(String first, second) {
    if (first == second) {
      return "inputMatch".tr;
    } else {
      if (first.length < 5) {
        return "pinMust5".tr;
      } else {
        return null;
      }
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return "passwordMust6".tr;
    } else {
      return null;
    }
  }

  static String? validateCode(String value) {
    if (value.isEmpty) {
      return '';
    } else {
      return null;
    }
  }

  static String? validatePin(String value) {
    if (value.length < 8) {
      return "Pin Must be atleast 8 characters ".tr;
    } else {
      return null;
    }
  }

  static String? validateName(String value) {
    if (value.length < 3) {
      return "Enter your full name".tr;
    } else {
      return null;
    }
  }

  static String? validateText(String value) {
    if (value.isEmpty) {
      return "textShort".tr;
    } else {
      return null;
    }
  }

  static String? validatePhone(String value) {
    Pattern pattern = r'^(?:[+0][1-9])?[0-9]{9,12}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return "Enter a valid phone number.";
    } else {
      return null;
    }
  }
}
