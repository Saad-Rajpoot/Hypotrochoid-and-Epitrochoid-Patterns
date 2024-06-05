import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hypotrochoid and Epitrochoid Patterns',
      home: TrochoidPatternDemo(),
    );
  }
}

class TrochoidPatternDemo extends StatefulWidget {
  @override
  _TrochoidPatternDemoState createState() => _TrochoidPatternDemoState();
}

class _TrochoidPatternDemoState extends State<TrochoidPatternDemo> {
  double _R = 100.0;
  double _r = 30.0;
  double _d = 60.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hypotrochoid and Epitrochoid Patterns'),
        actions: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent, // Set background color to transparent if needed
            child: ClipOval(
              child: Image.asset(
                'assets/image.jpg',
                fit: BoxFit.cover, // Use BoxFit.cover to ensure the image covers the circular area
                width: 50, // Ensure width and height are set to the diameter of the CircleAvatar
                height: 50,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: CustomPaint(
                size: Size(300, 300),
                painter: TrochoidPatternPainter(R: _R, r: _r, d: _d),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Slider(
                  value: _R,
                  min: 10,
                  max: 200,
                  divisions: 190,
                  label: 'R: $_R',
                  onChanged: (double value) {
                    setState(() {
                      _R = value;
                    });
                  },
                ),
                Slider(
                  value: _r,
                  min: 10,
                  max: 100,
                  divisions: 90,
                  label: 'r: $_r',
                  onChanged: (double value) {
                    setState(() {
                      _r = value;
                    });
                  },
                ),
                Slider(
                  value: _d,
                  min: 10,
                  max: 100,
                  divisions: 90,
                  label: 'd: $_d',
                  onChanged: (double value) {
                    setState(() {
                      _d = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TrochoidPatternPainter extends CustomPainter {
  final double R;
  final double r;
  final double d;

  TrochoidPatternPainter({required this.R, required this.r, required this.d});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final path = Path();
    double theta = 0.0;

    while (theta < 2 * pi) {
      final x = (R - r) * cos(theta) + d * cos((R - r) / r * theta);
      final y = (R - r) * sin(theta) - d * sin((R - r) / r * theta);
      if (theta == 0.0) {
        path.moveTo(size.width / 2 + x, size.height / 2 + y);
      } else {
        path.lineTo(size.width / 2 + x, size.height / 2 + y);
      }
      theta += 0.01;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(TrochoidPatternPainter oldDelegate) {
    return oldDelegate.R != R || oldDelegate.r != r || oldDelegate.d != d;
  }
}
