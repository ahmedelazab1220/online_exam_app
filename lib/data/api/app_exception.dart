abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  const ApiException({required this.message, this.statusCode});

  @override
  String toString() => message;
}

class InternetConnectionException extends ApiException {
  const InternetConnectionException({
    super.message = 'No internet connection',
  });
}

class ApiTimeoutException extends ApiException {
  const ApiTimeoutException({
    super.message = 'Request timed out. Please try again.',
  });
}

class BadRequestException extends ApiException {
  const BadRequestException({
    required super.message,
    super.statusCode,
  });
}

class UnauthorizedException extends ApiException {
  const UnauthorizedException({
    required super.message,
    super.statusCode,
  });
}

class ForbiddenException extends ApiException {
  const ForbiddenException({
    required super.message,
    super.statusCode,
  });
}

class NotFoundException extends ApiException {
  const NotFoundException({
    required super.message,
    super.statusCode,
  });
}

class InternalServerErrorException extends ApiException {
  const InternalServerErrorException({
    required super.message,
    super.statusCode,
  });
}

class CertificateException extends ApiException {
  const CertificateException({
    super.message = 'Invalid security certificate. Please contact support.',
  });
}

class RequestCancelledException extends ApiException {
  const RequestCancelledException({
    super.message = 'Request cancelled by the client.',
  });
}

class UnknownApiException extends ApiException {
  const UnknownApiException({
    super.message = 'An unknown error occurred',
  });
}

class DataParsingException extends ApiException {
  const DataParsingException({
    super.message = 'Data parsing failed',
  });
}
