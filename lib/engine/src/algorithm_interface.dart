import 'models/models.dart';

abstract class IAlgorithm {
  final int computerValue;

  IAlgorithm(this.computerValue);

  List<MarkedPoint> processMove(List<MarkedPoint> givenPositionsInAscOrder);

  (int? winner, GameStatus status) checkStatus(List<MarkedPoint> givenPositions);
}
