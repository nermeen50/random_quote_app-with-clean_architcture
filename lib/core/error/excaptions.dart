import 'package:equatable/equatable.dart';

class ServerExcaption extends Equatable implements Exception {
  final String? massage;

  const ServerExcaption([this.massage]);
  @override
  // TODO: implement props
  List<Object?> get props => [massage];

  @override
  String toString() {
    return '$massage';
  }
}

class FetchDataException extends ServerExcaption {
  const FetchDataException([message]) : super("Error During Communication");
}

class BadRequestException extends ServerExcaption {
  const BadRequestException([message]) : super("Bad Request");
}

class UnauthorizedException extends ServerExcaption {
  const UnauthorizedException([message]) : super("Unauthorized");
}

class NotFoundException extends ServerExcaption {
  const NotFoundException([message]) : super("Requested Info Not Found");
}

class ConflictException extends ServerExcaption {
  const ConflictException([message]) : super("Conflict Occurred");
}

class InternalServerErrorException extends ServerExcaption {
  const InternalServerErrorException([message])
      : super("Internal Server Error");
}

class NoInternetConnectionException extends ServerExcaption {
  const NoInternetConnectionException([message])
      : super("No Internet Connection");
}

class CacheExcaption implements Exception {}
