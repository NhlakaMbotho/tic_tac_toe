import 'dart:math';

import 'package:munch_test/engine/src/constants.dart';

class MarkedPoint {
  final int value;
  final Point position;

  MarkedPoint({required this.value, required this.position});

  factory MarkedPoint.pointByPlayer({required Point position}) =>
      MarkedPoint(position: position, value: EngineConstants.playerMarker);
}

extension GridExt on List<MarkedPoint> {
  MarkedPoint? existsOnGrid(Point position) {
    for (var i = 0; i < length; i++) {
      if (this[i].position == position) {
        return this[i];
      }
    }
    return null;
  }
}
