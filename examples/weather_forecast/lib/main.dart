import 'package:minerva/minerva.dart';

import 'builder/setting_builder.dart';

void main(List<String> args) async {
  // Bind server
  await Minerva.bind(args: args, setting: SettingBuilder().build());
}
