class Logger {
  final String tag;

  const Logger([this.tag]);

  void log(String message) {
    if (tag != null)
      print('[$tag] : $message');
    else
      print(message);
  }
}
