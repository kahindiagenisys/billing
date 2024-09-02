import 'dart:developer';

String? validator(String? value) {
  log("Start Validation");
  if (value == null || value.isEmpty) {
    return 'Text is empty';
  }
  return null;
}
