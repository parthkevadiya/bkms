import 'dart:io';

class SubmitInteractionsQuestionsRequestModel{
  final String name;
  final String? value;
  final List<String>? multipleValues;
  final File? file;

  SubmitInteractionsQuestionsRequestModel(
      this.name,
      this.value,
      this.multipleValues,
      this.file,
      );
}
