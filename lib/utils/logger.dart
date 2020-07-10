class Logger {
  static void log({String tag, String message}) {
    if (tag != null)
      print('[$tag] : $message');
    else
      print(message);
  }
}
