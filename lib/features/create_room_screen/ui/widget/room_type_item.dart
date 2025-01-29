import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_generate_container.dart';

class RoomTypeItem extends StatelessWidget {
  const RoomTypeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return    CustomGenerateContainer(
      width:100.w,
      height: 70.h,
      borderRadiusDirectional: BorderRadiusDirectional.all(Radius.circular(16.r)),
    );
  }
}
