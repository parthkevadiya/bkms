import 'package:equatable/equatable.dart';

import 'constant.dart';

class Failure extends Equatable {
  final String msg;

  Failure(this.msg);

  @override
  List<Object> get props => [msg];
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(ErrorMessages.networkFail);
}

class ServerFailure extends Failure {
  ServerFailure([String? msg]) : super(msg ?? ErrorMessages.serverFail);
}

class InternalFailure extends Failure {
  InternalFailure([String? msg]) : super(msg ?? ErrorMessages.internalFail);
}

class DataFailure extends Failure {
  DataFailure([String? msg]) : super(msg ?? ErrorMessages.dataFail);
}

class TokenFailure extends Failure {
  TokenFailure([String? msg]) : super(msg ?? ErrorMessages.tokenExpiry);
}
