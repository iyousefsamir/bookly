import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException diaError) {
    switch (diaError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad Certificate, please try later');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          diaError.response!.statusCode!,
          diaError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Transform timeout with ApiServer');
      case DioExceptionType.connectionError:
        return ServerFailure(
          'Please check your internet connection and try again. ',
        );

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, please try later');
      case DioExceptionType.transformTimeout:
        return ServerFailure('Transform timeout with ApiServer');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Intila Server error, please try later');
    } else {
      return ServerFailure('there was an error, please try later');
    }
  }
}
