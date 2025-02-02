import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rommify_app/core/helpers/extensions.dart';
import 'package:rommify_app/core/routing/routes.dart';
import 'package:rommify_app/core/theming/colors.dart';

import '../../create_room_screen/ui/widget/circle_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.colorPrimary,
      body: Stack(
        children: [
          CircleWidget(),
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: 23.w,right: 23.w,top: 89.h),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3 / 2,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        context.pushNamed(Routes.mainScreen);
                      },
                      child: Container(
                        width: 169.w,
                        height: 128.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadiusDirectional.circular(14.r),
                        ),
                        child: const Image(image: NetworkImage('https://th.bing.com/th/id/OIP.9nl2eFOD4SKNC_FIn0bSqQHaFj?rs=1&pid=ImgDetMain',)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
