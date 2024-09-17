import 'package:get_it/get_it.dart';
import 'package:munch_test/engine/engine.dart';

GetIt sl = GetIt.instance;

class DependencyInjection {
  static void init() {
    sl.registerSingleton<IAlgorithm>(RandomAlgo(0), signalsReady: true);
  }
}
