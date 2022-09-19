import 'dart:io';

import 'package:minerva/minerva.dart';

import 'apis_builder.dart';
import 'middlewares_builder.dart';
import 'server_builder.dart';
import 'loggers_builder.dart';

class SettingBuilder extends MinervaSettingBuilder {
  @override
  MinervaSetting build() {
    // Creates server setting
    return MinervaSetting(
        instance: Platform.numberOfProcessors,
        loggersBuilder: LoggersBuilder(),
        serverBuilder: ServerBuilder(),
        apisBuilder: ApisBuilder(),
        middlewaresBuilder: MiddlewaresBuilder());
  }
}
