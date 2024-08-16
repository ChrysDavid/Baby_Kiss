import 'package:flutter/material.dart';

class LumineuxProgressIndicator extends StatefulWidget {
  @override
  _LumineuxProgressIndicatorState createState() => _LumineuxProgressIndicatorState();
}

class _LumineuxProgressIndicatorState extends State<LumineuxProgressIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return CustomPaint(
          painter: _LumineuxPainter(_animationController.value),
          child: Container(
            width: 200,
            height: 20,
          ),
        );
      },
    );
  }
}

class _LumineuxPainter extends CustomPainter {
  final double animationValue;

  _LumineuxPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paintBlue = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    final double dashWidth = 10.0;
    final int dashCount = 5;

    for (int i = 0; i < dashCount; i++) {
      final double progress = (animationValue + i / dashCount) % 1.0;
      final double startX = size.width * progress;
      final double endX = startX + dashWidth;

      if (startX < size.width) {
        canvas.drawLine(
          Offset(startX, size.height / 2),
          Offset(endX, size.height / 2),
          paintBlue,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
