import 'package:flutter/cupertino.dart';
import 'package:flutter_app/api_calling_class/chopper_class.dart';
import 'package:flutter_app/models/collect_filters_request_model.dart';
import 'package:flutter_app/models/record_request_model.dart';
import 'package:injectable/injectable.dart';

abstract class IRecordService {
  Future<dynamic> load(RecordRequestModel recordRequestModel, token, context);
  Future<dynamic> export(RecordRequestModel recordRequestModel, token, context);
  Future<dynamic> collectFilters(
      CollectFiltersRequestModel getFiltersRequestModel, token, context);
}

@Singleton(as: IRecordService)
class RecordService implements IRecordService {
  CommonChopperClass commonChopperClass = CommonChopperClass();

  @override
  Future<dynamic> load(recordRequestModel, token, context) async {
    return await commonChopperClass.getRecords(
        recordRequestModel, token, context);
  }

  @override
  Future<dynamic> export(recordRequestModel, token, context) async {
    return await commonChopperClass.getExportRecords(
        recordRequestModel, token, context);
  }

  @override
  Future<dynamic> collectFilters(getFiltersRequestModel, token, context) async {
    return await commonChopperClass.collectFilters(
        getFiltersRequestModel, token, context);
  }
}
