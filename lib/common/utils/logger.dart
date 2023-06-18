import 'package:logger/logger.dart';

class CustomLogger {
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      colors: false,
      // methodCount: 8,
      // errorMethodCount: 5,
      // lineLength: 150,
      // colors: false,
      // printEmojis: true,
    ),
  );
}
