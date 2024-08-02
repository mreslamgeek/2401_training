abstract class ErrorExceptions implements Exception {
  String errorMSG;
  ErrorExceptions(this.errorMSG);

  @override
  String toString() => '$runtimeType:\t$errorMSG';
}

class ServerException extends ErrorExceptions {
  ServerException(super.errorMSG);
}

class RequestException extends ErrorExceptions {
  RequestException(super.errorMSG);
}

class NetworkException implements ErrorExceptions {
  @override
  String errorMSG = 'Internet Connection | Check your network connection.';
}

class EmptyOrNullListException implements ErrorExceptions {
  @override
  String errorMSG = 'Empty List | No Results Available.';
}
