class ErrorHandler {
  static void logError(Object error, StackTrace stackTrace) {
    // Log error to a remote server or console
    print('Error: $error');
    print('StackTrace: $stackTrace');
    // TODO: Integrate with a logging service like Sentry, Firebase Crashlytics, etc.
  }
}
