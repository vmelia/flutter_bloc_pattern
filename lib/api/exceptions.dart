abstract class ExceptionBase {
  String message;
  ExceptionBase(this.message);
}

class NoInternetException extends ExceptionBase {
  NoInternetException(String message) : super(message);
}

class NoServiceFoundException extends ExceptionBase {
  NoServiceFoundException(String message) : super(message);
}

class InvalidFormatException extends ExceptionBase {
  InvalidFormatException(String message) : super(message);
}

class UnknownException extends ExceptionBase {
  UnknownException(String message) : super(message);
}
