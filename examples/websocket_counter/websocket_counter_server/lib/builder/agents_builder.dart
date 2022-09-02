import 'package:minerva/minerva.dart';

import '../agents/counter_agent.dart';

class AgentsBuilder extends MinervaAgentsBuilder {
  @override
  List<AgentData> build() {
    return [AgentData('counter', CounterAgent())];
  }
}
