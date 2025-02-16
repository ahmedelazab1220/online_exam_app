import 'dart:async';
import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import '../../domain/core/api_result.dart';
import 'app_exception.dart';

@singleton
class ApiManager {
  Future<Result<T>> execute<T>(Future<T> Function() apiCall) async {
    try {
      final response = await apiCall();
      return SuccessResult<T>(response);
    } on SocketException {
      return FailureResult<T>(const InternetConnectionException());
    } on DioException catch (e) {
      return _handleDioException<T>(e);
    } on FormatException {
      return FailureResult<T>(const DataParsingException());
    } catch (e) {
      return FailureResult<T>(const UnknownApiException());
    }
  }

  Result<T> _handleDioException<T>(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return FailureResult<T>(
          ApiTimeoutException(message: _getTimeoutMessage(e.type)),
        );
      case DioExceptionType.badCertificate:
        return FailureResult<T>(
          const CertificateException(
            message: 'Invalid security certificate. Please contact support.',
          ),
        );
      case DioExceptionType.badResponse:
        if (e.response == null) {
          return FailureResult<T>(
              const UnknownApiException(message: 'Unexpected server error.'));
        }
        return _handleBadResponse<T>(e.response!);
      case DioExceptionType.cancel:
        return FailureResult<T>(
          const RequestCancelledException(
            message: 'Request cancelled by the client.',
          ),
        );
      case DioExceptionType.connectionError:
        return FailureResult<T>(
          const InternetConnectionException(
            message: 'Connection failed. Check your network.',
          ),
        );
      case DioExceptionType.unknown:
        return FailureResult<T>(
          UnknownApiException(
              message: e.message ?? 'Unexpected error occurred.'),
        );
    }
  }

  Result<T> _handleBadResponse<T>(Response response) {
    final statusCode = response.statusCode ?? 500;
    final errorMessage = _extractErrorMessage(response.data);

    switch (statusCode) {
      case 400:
        return FailureResult<T>(
          BadRequestException(message: errorMessage, statusCode: statusCode),
        );
      case 401:
        return FailureResult<T>(
          UnauthorizedException(message: errorMessage, statusCode: statusCode),
        );
      case 403:
        return FailureResult<T>(
          ForbiddenException(message: errorMessage, statusCode: statusCode),
        );
      case 404:
        return FailureResult<T>(
          NotFoundException(message: errorMessage, statusCode: statusCode),
        );
      case 500:
        return FailureResult<T>(
          InternalServerErrorException(
            message: errorMessage,
            statusCode: statusCode,
          ),
        );
      default:
        return FailureResult<T>(
          UnknownApiException(
              message: 'Unexpected error: $statusCode - $errorMessage'),
        );
    }
  }

  String _extractErrorMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data['message']?.toString() ?? 'Unknown server error';
    }
    return data.toString();
  }

  String _getTimeoutMessage(DioExceptionType type) {
    switch (type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Check your internet.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Response timeout. Please try again.';
      default:
        return 'Timeout occurred';
    }
  }
}
