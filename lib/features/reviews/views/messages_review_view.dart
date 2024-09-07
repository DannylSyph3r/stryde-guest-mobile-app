import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/features/reviews/widgets/review_card.dart';

class MessagesReviewView extends ConsumerStatefulWidget {
  const MessagesReviewView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MessagesReviewViewState();
}

class _MessagesReviewViewState extends ConsumerState<MessagesReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Profile",
        context: context,
        implyLeading: true,
        toolbarHeight: 70.h,
        color: Colors.transparent,
        isTitleCentered: true,
      ),
      body: ListView(children: [
        20.sbH,
        Padding(
          padding: 15.padH,
          child: Row(children: [
            Container(
              height: 60.h,
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
                  child: AppGraphics.memeoji.png.myImage(fit: BoxFit.contain)),
            ),
            15.sbW,
            Expanded(
                child: Column(
              children: [
                "Akinola Daniel Eri-ife"
                    .txt16(
                        textAlign: TextAlign.left,
                        fontW: F.w6,
                        overflow: TextOverflow.ellipsis)
                    .alignCenterLeft(),
                3.sbH,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "4.5".txt14(textAlign: TextAlign.left, fontW: F.w4),
                    5.sbW,
                    Icon(
                      PhosphorIconsFill.star,
                      size: 15.h,
                      color: Palette.strydeOrange,
                    )
                  ],
                ).alignCenterLeft(),
              ],
            )),
            // Icon(
            //   PhosphorIconsFill.envelope,
            //   size: 30.h,
            //   color: Palette.strydeOrange,
            // ),
          ]),
        ),
        30.sbH,
        Padding(
          padding: 15.padH,
          child: "Reviews"
              .txt18(fontW: F.w6, textAlign: TextAlign.left)
              .alignCenterLeft(),
        ),
        20.sbH,
        SizedBox(
          height: 260.h,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: 10.padH,
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return const ReviewCard();
            },
          ),
        ),
        50.sbH
      ]),
    );
  }
}
