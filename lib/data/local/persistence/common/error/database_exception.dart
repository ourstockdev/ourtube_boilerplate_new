abstract class DatabaseException extends FormatException {
  const DatabaseException(String message) : super(message);
}

class DatabaseNoResultException extends DatabaseException {
  const DatabaseNoResultException() : super('No Result');
}
