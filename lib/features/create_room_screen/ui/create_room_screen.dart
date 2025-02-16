import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rommify_app/core/helpers/extensions.dart';
import 'package:rommify_app/core/routing/app_router.dart';
import 'package:rommify_app/core/theming/colors.dart';
import 'package:rommify_app/features/create_room_screen/ui/widget/circle_widget.dart';
import 'package:rommify_app/features/create_room_screen/ui/widget/custom_generate_container.dart';
import 'package:rommify_app/features/create_room_screen/ui/widget/room_type_list_view.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';

class CreateRoomScreen extends StatelessWidget {
  const CreateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsManager.colorPrimary,
        body: Stack(
          children: [
            CircleWidget(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            // Transparent background
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.r),
                                topRight:
                                Radius.circular(20.r)), // Rounded corners
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 20.h, left: 8.w, right: 8.w),
                            child: Text(
                              "put this wall clock on the wall of room image above the sofa,fit it with with light and shadow of room image",
                              style: TextStyles.font14WhiteRegular.copyWith(
                                  fontSize: 16.sp, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 30.h,
                            ),
                            // Placeholder for bottom sections (e.g., buttons or icons)
                            Expanded(
                              child: CustomGenerateContainer(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(24.r)),
                                text: 'room image',
                                style: TextStyles.font14WhiteRegular.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),
                                icon: Icons.ice_skating_rounded,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: CustomGenerateContainer(
                                icon: Icons.ice_skating_rounded,
                                text: 'room image',
                                style: TextStyles.font14WhiteRegular.copyWith(fontSize: 12.sp,fontWeight: FontWeight.w400),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              children: [
                                CustomGenerateContainer(
                                    width: 80,
                                    height: 26.5,
                                    text: 'legnth(cm)',
                                    style: TextStyles.font12GreyLight
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomGenerateContainer(
                                    width: 80,
                                    height: 26.5,
                                    text: 'legnth(cm)',
                                    style: TextStyles.font12GreyLight
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                CustomGenerateContainer(
                                    width: 80,
                                    height: 26.5,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(16.r)),
                                    text: 'legnth(cm)',
                                    style: TextStyles.font12GreyLight
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell
                        (

                          child: Text("room type", style: TextStyles.font14WhiteRegular),
                      onTap: () {
                        context.pushNamed(Routes.exploreScreen);
                      },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      const RoomTypeListView(),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("result style",
                          style: TextStyles.font14WhiteRegular),
                      SizedBox(
                        height: 3.h,
                      ),
                      const RoomTypeListView(),
                      SizedBox(
                        height: 50.h,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            print("Purple button pressed!");


                            context.pushNamed(Routes.generateRoomScreen);
                            // Define what happens when the button is pressed
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsManager.mainBurble,
                            // Set the button color to purple
                            padding: EdgeInsets.symmetric(
                                horizontal: 100.w, vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(32), // Rounded corners
                            ),
                          ),
                          child: Text('GENERATE',
                              style: TextStyles.font21BlackSemiBold.copyWith(
                                  color: Colors.white, fontSize: 18.sp)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

          ],
        ));
  }
}
