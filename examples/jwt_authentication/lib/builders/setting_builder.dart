import 'dart:io';

import 'package:minerva/minerva.dart';

import 'apis_builder.dart';
import 'middlewares/middlewares_builder.dart';
import 'loggers_builder.dart';

class SettingBuilder extends MinervaSettingBuilder {
  @override
  MinervaSetting build() {
    // Creates server setting
    return MinervaSetting(
        instance: Platform.numberOfProcessors,
        loggersBuilder: LoggersBuilder(),
        apisBuilder: ApisBuilder(),
        middlewaresBuilder: MiddlewaresBuilder());
  }
}
