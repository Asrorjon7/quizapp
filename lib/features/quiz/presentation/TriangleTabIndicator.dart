import 'package:flutter/material.dart';

class TriangleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  TriangleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TrianglePainter(color: color, radius: radius);
  }
}

class _TrianglePainter extends BoxPainter {
  final Color color;
  final double radius;

  _TrianglePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final double triangleHeight = radius;
    final double triangleWidth = radius * 2;

    final Path path = Path();
    final double startX = offset.dx + configuration.size!.width / 2 - triangleWidth / 2;
    final double endX = startX + triangleWidth;
    final double startY = offset.dy + configuration.size!.height;
    final double endY = offset.dy + configuration.size!.height;

    path.moveTo(startX, endY);
    path.lineTo(offset.dx + configuration.size!.width / 2, startY - triangleHeight);
    path.lineTo(endX, endY);
    path.close();

    canvas.drawPath(path, paint);
  }
}
