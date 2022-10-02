import 'dart:io';

class SubmitCampusHangoutReportRequestModel{
  final String name;
  final String? value;
  final List<String>? multipleValues;
  final File? file;

  SubmitCampusHangoutReportRequestModel(
      this.name,
      this.value,
      this.multipleValues,
      this.file,
      );
}
