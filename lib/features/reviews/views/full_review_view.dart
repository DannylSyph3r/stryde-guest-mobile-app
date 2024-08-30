import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/features/reviews/providers/review_providers.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/appbar.dart';
import 'package:stryde_guest_app/features/reviews/widgets/review_card.dart';

class FullReviewView extends ConsumerStatefulWidget {
  const FullReviewView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FullReviewViewState();
}

class _FullReviewViewState extends ConsumerState<FullReviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title: "Reviews",
          context: context,
          isTitleText: true,
          implyLeading: true,
          overrideBackButtonAction: true,
          backFunction: () {
            ref.invalidate(reviewVisibilityProvider);
          },
          toolbarHeight: 70.h,
          color: Colors.transparent,
          isTitleCentered: true,
          actions: [
            Padding(
              padding: 10.padH,
              child: Container(
                height: 40.h,
                width: 75.w,
                decoration: BoxDecoration(
                    color: Palette.buttonBG,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "4.5".txt16(textAlign: TextAlign.left, fontW: F.w4),
                    5.sbW,
                    Icon(PhosphorIconsFill.star,
                        size: 20.h, color: Palette.strydeOrange)
                  ],
                ),
              ),
            )
          ]),
      body: ListView(
        children: [
          20.sbH,
          ListView.separated(
              shrinkWrap: true,
              padding: 5.padH,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return 25.sbH;
              },
              itemBuilder: (context, index) {
                return ReviewCard();
              }),
          30.sbH
        ],
      ),
    );
  }
}
