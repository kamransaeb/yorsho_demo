import 'package:logger/logger.dart';
import 'dart:developer' as developer;
import '../log_service.dart';

class DebugLogServiceImpl extends LogService {

  late final Logger _logger;

  DebugLogServiceImpl({Logger? logger}) {
    _logger = logger ??
    Logger(
      printer: PrefixPrinter(
        PrettyPrinter(
          methodCount: 0,
          errorMethodCount: 500,
          lineLength: 100,
        ),
      ),
      output: _MyConsoleOutput(),
    );
  }

  @override
  void e(String message, e, StackTrace? stackTrace) {
    _logger.e(message, error: e, stackTrace: stackTrace);
  }

  @override
  void i(String message) {
    _logger.i(message);
  }

  @override
  void w(String message, [e, StackTrace? stackTrace]) {
    _logger.w(message, error: e, stackTrace: stackTrace);
  }

}

class _MyConsoleOutput extends LogOutput {
  @override
  void output(OutputEvent event) {
    event.lines.forEach(developer.log);
  }

}