import 'package:flutter/material.dart';

import 'curved_edges.dart';

class CurvedEdgedWidget extends StatelessWidget {
  const CurvedEdgedWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
