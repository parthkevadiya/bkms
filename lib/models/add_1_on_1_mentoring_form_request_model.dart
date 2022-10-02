import 'dart:io';

class Add1On1MentoringFormRequestModel{
  final String name;
  final String? value;
  final List<String>? multipleValues;
  final File? file;

  Add1On1MentoringFormRequestModel(
      this.name,
      this.value,
      this.multipleValues,
      this.file,
      );
}
