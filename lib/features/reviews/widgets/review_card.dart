import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/reviews/providers/review_providers.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class ReviewCard extends ConsumerWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool replyVisibility = ref.watch(reviewVisibilityProvider);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            height: 250.h,
            width: 360.w, // Add a fixed width for the ReviewCard
            decoration: BoxDecoration(
              color: Palette.buttonBG,
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Palette.buttonBG.withOpacity(0.5),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color:
                                        Palette.strydeOrange.withOpacity(0.2),
                                    spreadRadius: 10,
                                    blurRadius: 15,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: AppGraphics.memeoji.png
                                    .myImage(fit: BoxFit.contain),
                              ),
                            ),
                          ],
                        ),
                        15.sbH,
                        "Tobirama Bt"
                            .txt16(
                              textAlign: TextAlign.left,
                              fontW: F.w6,
                              overflow: TextOverflow.ellipsis,
                            )
                            .alignCenterLeft(),
                        15.sbH,
                        "January 24, 2023".txt14(
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                        ),
                        15.sbH,
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            "4.5".txt14(textAlign: TextAlign.left, fontW: F.w4),
                            5.sbW,
                            Icon(
                              PhosphorIconsFill.star,
                              size: 15.h,
                              color: Palette.strydeOrange,
                            ),
                          ],
                        ).alignCenterLeft(),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.loose,
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: Palette.strydeOrange,
                          width: 2,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: AppTexts.reviewPlaceholderText.txt(
                              size: 17.sp,
                              textAlign: TextAlign.center,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 250.h,
            width: 360.w,
            child: Visibility(
              visible: replyVisibility,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      PhosphorIconsBold.chatCenteredText,
                      size: 20.h,
                      color: Palette.strydeOrange,
                    ).alignCenterRight(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
