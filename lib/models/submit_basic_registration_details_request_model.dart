import 'dart:io';

class SubmitBasicRegistrationDetailsRequestModel{
  final String name;
  final String? value;
  final List<String>? multipleValues;
  final File? file;

  SubmitBasicRegistrationDetailsRequestModel(
      this.name,
      this.value,
      this.multipleValues,
      this.file,
      );
}
