import 'dart:io';

class AddEducationMentoringFormRequestModel{
  final String name;
  final String? value;
  final List<String>? multipleValues;
  final File? file;

  AddEducationMentoringFormRequestModel(
      this.name,
      this.value,
      this.multipleValues,
      this.file,
      );
}
