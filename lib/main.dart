import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SunEffectScreen(),
    );
  }
}

class SunEffectScreen extends StatefulWidget {
  @override
  _SunEffectScreenState createState() => _SunEffectScreenState();
}

class _SunEffectScreenState extends State<SunEffectScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController for smooth animation
    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);

    // Animation for position (for the sun to move horizontally)
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Animation for the color change
    _colorAnimation = ColorTween(begin: Colors.orange, end: Colors.yellow).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return CustomPaint(
              size: Size(double.infinity, double.infinity),
              painter: SunPainter(_animation.value, _colorAnimation.value),
            );
          },
        ),
      ),
    );
  }
}

class SunPainter extends CustomPainter {
  final double position;
  final Color? color;

  SunPainter(this.position, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color!
      ..style = PaintingStyle.fill;

    // Drawing the sun as a circle
    double x = position * size.width; // Moves horizontally
    double y = size.height * 0.2; // Keeps sun at a fixed vertical position

    canvas.drawCircle(Offset(x, y), 50, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
