import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 180.h,),
                Center(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          // Transparent background
                          borderRadius:
                              BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight: Radius.circular(20.r)
                              ), // Rounded corners
                        ),
                        child:  Padding(
                          padding: EdgeInsets.only(bottom: 180.h,top: 30.h,right: 30.w,left: 30.w),
                          child:  Text(
                            "Ex: create a room with warm\nmood, modern furniture, classic\n brown carpet and wall clock.",
                            style: TextStyle(
                              color: Colors.white, // Text color
                              fontSize: 14.sp, // Font size
                              fontWeight: FontWeight.w100,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 30.h,),
                          // Placeholder for bottom sections (e.g., buttons or icons)
                          Container(
                            width: 125.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                // Transparent box
                                borderRadius:BorderRadiusDirectional.only(
                                  topStart: Radius.circular(0.r),
                                  bottomStart: Radius.circular(20.r),
                                  topEnd: Radius.circular(20.r),
                                  bottomEnd: Radius.circular(20.r),
                                )
                      
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Container(
                            width: 125.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                // Transparent box
                                borderRadius:BorderRadiusDirectional.only(
                                  topStart: Radius.circular(20.r),
                                  bottomStart: Radius.circular(20.r),
                                  topEnd: Radius.circular(0.r),
                                  bottomEnd: Radius.circular(20.r),
                                )
                      
                            ),
                          ),
                      
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),

            CircleWidget(),
          ],
        ));
  }
}
