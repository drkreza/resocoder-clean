class MyLog {
  /*  static void MyLog(String message) {
    // Implement your logging logic for info level
    print('INFO: $message');
  } */

  static void log(String tag, dynamic error) {
    // Implement your logging logic for error level
    print('$tag : ${error.toString()}');
  }

  // Add more log methods as needed (e.g., warning, debug).
}
