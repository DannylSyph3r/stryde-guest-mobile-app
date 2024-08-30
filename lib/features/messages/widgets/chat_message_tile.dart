import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class ChatMessageTile extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String lastMessage;
  final String profilePicture;
  final VoidCallback onTileTap;

  const ChatMessageTile({
    Key? key,
    required this.name,
    required this.date,
    required this.time,
    required this.lastMessage,
    required this.profilePicture,
    required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap, // Call the onTileTap callback here
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0.h, left: 25.w),
            decoration: BoxDecoration(
              color: Palette.buttonBG,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 2.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: 35.w, right: 10.w, top: 18.h, bottom: 18.h),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                constraints: BoxConstraints(
                                  minWidth: 100.w,
                                  maxWidth: 200.w,
                                ),
                                child: name.txt(
                                    size: 13.sp,
                                    fontW: F.w6,
                                    overflow: TextOverflow.ellipsis)),
                            5.sbW,
                            Icon(
                              PhosphorIconsFill.circle,
                              size: 10.h,
                              color: Palette.strydeOrange,
                            ),
                          ],
                        ),
                        date.txt(size: 11.5.sp),
                      ]),
                  15.sbH,
                  SizedBox(
                    width: 250.w,
                    child: lastMessage.txt(
                      size: 12.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ).alignCenterLeft(),
                  10.sbH,
                  time
                      .txt(
                          size: 11.sp, color: Palette.strydeOrange, fontW: F.w6)
                      .alignCenterLeft(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  5.sbH,
                  CircleAvatar(
                    radius: 23.r,
                    backgroundColor: Palette.strydeOrange,
                    child: CircleAvatar(
                      radius: 23.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage(profilePicture),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
