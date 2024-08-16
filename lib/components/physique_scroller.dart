import 'package:flutter/material.dart';

class CustomScrollPhysics extends ScrollPhysics {
  CustomScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  CustomScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    // Si l'utilisateur essaie de faire défiler vers la gauche (de droite à gauche)
    if (offset < 0) {
      return 0.0; // Bloquer le défilement
    }
    return offset; // Autoriser le défilement vers la droite (de gauche à droite)
  }
}
