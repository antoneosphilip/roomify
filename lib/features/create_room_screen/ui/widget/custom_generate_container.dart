import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGenerateContainer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadiusGeometry borderRadius; // إضافة متغير borderRadius
  final BorderRadiusDirectional? borderRadiusDirectional; // إضافة متغير borderRadius

  const CustomGenerateContainer({super.key,  this.height=90,  this.width=80,  this.borderRadius=BorderRadius.zero,  this.borderRadiusDirectional=BorderRadiusDirectional.zero, });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        // Transparent box
        borderRadius: borderRadius==BorderRadius.zero?borderRadiusDirectional:borderRadius,
      ),
    );
  }
}
