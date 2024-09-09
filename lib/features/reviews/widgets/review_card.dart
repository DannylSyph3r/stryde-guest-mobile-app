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
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            height: 250.h,
            decoration: BoxDecoration(
              color: Palette.buttonBG,
              borderRadius: BorderRadius.all(Radius.circular(15.r)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Palette.buttonBG.withOpacity(0.5),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Palette.strydeOrange.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Center(
                          child: AppGraphics.memeoji.png
                              .myImage(fit: BoxFit.contain)),
                    ),
                    15.sbW,
                    Expanded(
                        child: Column(
                      children: [
                        Container(
                          child: "Amane Miyuzaki"
                              .txt14(
                                  textAlign: TextAlign.left,
                                  fontW: F.w6,
                                  overflow: TextOverflow.ellipsis)
                              .alignCenterLeft(),
                        ),
                        3.sbH,
                        "January 24th, 2023"
                            .txt12(textAlign: TextAlign.left, fontW: F.w4)
                            .alignCenterLeft(),
                      ],
                    ))
                  ],
                ),
                20.sbH,
                Center(
                  child: AppTexts.reviewPlaceholderText.txt(
                    size: 17.sp,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
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
