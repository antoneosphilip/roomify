import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rommify_app/core/theming/colors.dart';
import 'package:rommify_app/features/create_room_screen/ui/widget/circle_widget.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.colorPrimary,
      body: Stack(
        children: [

          Column(

          ),
          CircleWidget(),

        ],
      )
    );
  }
}




// class ShapeEffectScreen extends StatefulWidget {
//   @override
//   _ShapeEffectScreenState createState() => _ShapeEffectScreenState();
// }
//
// class _ShapeEffectScreenState extends State<ShapeEffectScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _xAnimation, _yAnimation;
//   late int _currentStep;
//   Color _currentColor = Colors.blue;
//
//   // النقاط المتوسطة
//   final List<Offset> _path = [
//     Offset(0.5, 0.0), // منتصف الحافة العليا
//     Offset(1.0, 0.5), // منتصف الحافة اليمنى
//     Offset(0.5, 1.0), // منتصف الحافة السفلى
//     Offset(0.0, 0.5), // منتصف الحافة اليسرى
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _currentStep = 0;
//     // لا نحتاج الآن للوصول إلى MediaQuery في initState()
//     // سيتم تحديد الـ AnimationController في didChangeDependencies
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     // الآن نستخدم MediaQuery في didChangeDependencies لأن context هنا مكتمل
//     final size = MediaQuery.of(context).size;
//
//     // إنشاء AnimationController للتحكم في الحركة
//     _controller = AnimationController(
//       duration: Duration(seconds: 5), // مدة الانتقال من نقطة لأخرى
//       vsync: this,
//     )..addListener(() {
//       // تأجيل استدعاء setState بعد اكتمال مرحلة البناء
//       if (mounted) {
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           setState(() {
//             // تحديث قيم المواقع بناءً على التقدم في الرسوم المتحركة
//           });
//         });
//       }
//     });
//
//     // ضبط الـ Tween لكل من المحور X و Y باستخدام Curves.linear لجعل السرعة ثابتة
//     _xAnimation = Tween<double>(
//       begin: _path[_currentStep].dx * size.width,
//       end: _path[(_currentStep + 1) % 4].dx * size.width,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.linear, // سرعة ثابتة
//     ));
//
//     _yAnimation = Tween<double>(
//       begin: _path[_currentStep].dy * size.height,
//       end: _path[(_currentStep + 1) % 4].dy * size.height,
//     ).animate(CurvedAnimation(
//       parent: _controller,
//       curve: Curves.linear, // سرعة ثابتة
//     ));
//
//     // بدء الرسوم المتحركة
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (context, child) {
//           // انتظار انتهاء الحركة الحالية وتحديث المسار
//           if (_controller.isCompleted) {
//             // تأجيل تحديث setState بعد البناء
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               setState(() {
//                 _currentStep = (_currentStep + 1) % 4; // الانتقال للخطوة التالية
//                 _xAnimation = Tween<double>(
//                   begin: _path[_currentStep].dx * MediaQuery.of(context).size.width,
//                   end: _path[(_currentStep + 1) % 4].dx * MediaQuery.of(context).size.width,
//                 ).animate(CurvedAnimation(
//                   parent: _controller,
//                   curve: Curves.linear, // سرعة ثابتة
//                 ));
//
//                 _yAnimation = Tween<double>(
//                   begin: _path[_currentStep].dy * MediaQuery.of(context).size.height,
//                   end: _path[(_currentStep + 1) % 4].dy * MediaQuery.of(context).size.height,
//                 ).animate(CurvedAnimation(
//                   parent: _controller,
//                   curve: Curves.linear, // سرعة ثابتة
//                 ));
//
//                 _controller.reset();
//                 _controller.forward();
//               });
//             });
//           }
//
//           return CustomPaint(
//             painter: MovingShapePainter(
//               _xAnimation.value,
//               _yAnimation.value,
//               _currentColor,
//             ),
//             child: Container(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class MovingShapePainter extends CustomPainter {
//   final double x;
//   final double y;
//   final Color shapeColor;
//
//   MovingShapePainter(this.x, this.y, this.shapeColor);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = shapeColor
//       ..style = PaintingStyle.fill;
//
//     // رسم الدائرة
//     canvas.drawCircle(Offset(x, y), 50, paint);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
