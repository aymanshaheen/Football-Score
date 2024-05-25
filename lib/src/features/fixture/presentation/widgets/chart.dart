
import 'package:flutter/material.dart';
import 'dart:math' as math;


class RadarChartPainter extends CustomPainter {
  final int numAxes;
  final List<double> dataValues1;
  final List<double> dataValues2;
  final double maxValue;
  final Color axisColor;
  final Color dataColor1;
  final Color dataColor2;
  final List<String> axisLabels;

  RadarChartPainter({
    required this.numAxes,
    required this.dataValues1,
    required this.dataValues2,
    required this.maxValue,
    required this.axisColor,
    required this.dataColor1,
    required this.dataColor2,
    required this.axisLabels,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) * 0.8;
    final angleStep = 2 * math.pi / numAxes;
    const rotationOffset = math.pi / 2;
    for (var i = 0; i < numAxes; i++) {
      final angle = i * angleStep - rotationOffset;
      final endX = center.dx + radius * math.cos(angle);
      final endY = center.dy + radius * math.sin(angle);
      canvas.drawLine(center, Offset(endX, endY), Paint()..color = axisColor);
    }

    drawDataPolygon(canvas, center, radius, angleStep, dataValues1, dataColor1,
        rotationOffset);
    drawDataPolygon(canvas, center, radius, angleStep, dataValues2, dataColor2,
        rotationOffset);

    for (var i = 0; i < numAxes; i++) {
      final angle = i * angleStep - rotationOffset;
      final endX = center.dx + radius * 1.2 * math.cos(angle);
      final endY = center.dy + radius * 1.1 * math.sin(angle);
      final textPainter = TextPainter(
        text: TextSpan(
            text: axisLabels[i],
            style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas,
          Offset(endX - textPainter.width / 2, endY - textPainter.height));
    }
  }

  void drawDataPolygon(
      Canvas canvas,
      Offset center,
      double radius,
      double angleStep,
      List<double> dataValues,
      Color dataColor,
      double rotationOffset) {
    final path = Path();
    for (var i = 0; i < numAxes; i++) {
      final angle = i * angleStep - rotationOffset;
      final valueRatio = dataValues[i] / maxValue;
      final endX = center.dx + radius * valueRatio * math.cos(angle);
      final endY = center.dy + radius * valueRatio * math.sin(angle);
      if (i == 0) {
        path.moveTo(endX, endY);
      } else {
        path.lineTo(endX, endY);
      }
    }
    path.close();
    canvas.drawPath(
        path,
        Paint()
          ..color = dataColor.withOpacity(0.5)
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    if (oldDelegate is RadarChartPainter) {
      return numAxes != oldDelegate.numAxes ||
          dataValues1 != oldDelegate.dataValues1 ||
          dataValues2 != oldDelegate.dataValues2 ||
          maxValue != oldDelegate.maxValue ||
          axisColor != oldDelegate.axisColor ||
          dataColor1 != oldDelegate.dataColor1 ||
          dataColor2 != oldDelegate.dataColor2 ||
          axisLabels != oldDelegate.axisLabels;
    }
    return false;
  }
}

class RadarChart extends StatelessWidget {
  final int numAxes;
  final List<double> dataValues1;
  final List<double> dataValues2;
  final double maxValue;
  final Color axisColor;
  final Color dataColor1;
  final Color dataColor2;
  final List<String> axisLabels;

  const RadarChart({
    super.key,
    required this.numAxes,
    required this.dataValues1,
    required this.dataValues2,
    required this.maxValue,
    required this.axisColor,
    required this.dataColor1,
    required this.dataColor2,
    required this.axisLabels,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RadarChartPainter(
        numAxes: numAxes,
        dataValues1: dataValues1,
        dataValues2: dataValues2,
        maxValue: maxValue,
        axisColor: axisColor,
        dataColor1: dataColor1,
        dataColor2: dataColor2,
        axisLabels: axisLabels,
      ),
    );
  }
}
