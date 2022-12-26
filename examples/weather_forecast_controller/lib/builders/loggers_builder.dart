import 'package:minerva/minerva.dart';

class LoggersBuilder extends MinervaLoggersBuilder {
  @override
  List<Logger> build() {
    final loggers = <Logger>[];

    // Adds console logger to log pipeline
    loggers.add(ConsoleLogger());

    return loggers;
  }
}
