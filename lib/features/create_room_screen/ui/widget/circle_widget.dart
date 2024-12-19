import 'package:flutter/material.dart';

class CircleWidget extends StatefulWidget {
  @override
  _CircleWidgetState createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _xAnimation, _yAnimation;
  late int _currentStep;
  late Color _currentColor;

  // النقاط المتوسطة مع عكس الاتجاهات
  final List<Offset> _path = [
    Offset(0.5, 1.0), // منتصف الحافة السفلى
    Offset(0.0, 0.5), // منتصف الحافة اليسرى
    Offset(0.5, 0.0), // منتصف الحافة العليا
    Offset(1.0, 0.5), // منتصف الحافة اليمنى
  ];

  @override
  void initState() {
    super.initState();
    _currentStep = 0;
    _currentColor = Colors.purple; // بداية اللون الموڤ
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final size = MediaQuery.of(context).size;

    _controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    )..addListener(() {
      if (mounted) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {});
        });
      }
    });

    _xAnimation = Tween<double>(
      begin: _path[_currentStep].dx * size.width,
      end: _path[(_currentStep + 1) % 4].dx * size.width,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _yAnimation = Tween<double>(
      begin: _path[_currentStep].dy * size.height,
      end: _path[(_currentStep + 1) % 4].dy * size.height,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        if (_controller.isCompleted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              _currentStep = (_currentStep + 1) % 4;
              final size = MediaQuery.of(context).size;
              _xAnimation = Tween<double>(
                begin: _path[_currentStep].dx * size.width,
                end: _path[(_currentStep + 1) % 4].dx * size.width,
              ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

              _yAnimation = Tween<double>(
                begin: _path[_currentStep].dy * size.height,
                end: _path[(_currentStep + 1) % 4].dy * size.height,
              ).animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

              _controller.reset();
              _controller.forward();
            });
          });
        }

        // حساب النسبة المئوية للحركة عبر المسار الكامل
        double progress = _controller.value + _currentStep; // النسبة الإجمالية للحركة على المسار
        double normalizedProgress = (progress % 4) / 4;

        // تحديد اللون بناءً على النسبة
        if (normalizedProgress < 0.25) {
          _currentColor = Color.lerp(
            Colors.purple,
            Colors.yellow,
            normalizedProgress * 4,
          )!;
        } else if (normalizedProgress < 0.5) {
          _currentColor = Color.lerp(
            Colors.yellow,
            Colors.orange,
            (normalizedProgress - 0.25) * 4,
          )!;
        } else if (normalizedProgress < 0.75) {
          _currentColor = Color.lerp(
            Colors.orange,
            Colors.deepPurple,
            (normalizedProgress - 0.5) * 4,
          )!;
        } else {
          _currentColor = Color.lerp(
            Colors.deepPurple,
            Colors.purple,
            (normalizedProgress - 0.75) * 4,
          )!;
        }

        return CustomPaint(
          painter: MovingShapePainter(
            _xAnimation.value,
            _yAnimation.value,
            _currentColor,
          ),
          child: Container(),
        );
      },
    );
  }
}

class MovingShapePainter extends CustomPainter {
  final double x;
  final double y;
  final Color shapeColor;

  MovingShapePainter(this.x, this.y, this.shapeColor);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [
          shapeColor.withOpacity(0.6), // المركز
          shapeColor.withOpacity(0.2), // التدرج
          Colors.transparent, // الحواف
        ],
        stops: [0.3, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(x, y), radius: 100))
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(x, y), 100, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
