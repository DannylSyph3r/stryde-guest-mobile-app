import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/features/reviews/widgets/review_card.dart';
import 'package:stryde_guest_app/utils/widgets/row_railer.dart';

class MessagesReviewView extends ConsumerStatefulWidget {
  const MessagesReviewView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MessagesReviewViewState();
}

class _MessagesReviewViewState extends ConsumerState<MessagesReviewView> {
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  void dispose() {
    _currentIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AppGraphics.box.png.myImage(),
        Padding(
          padding: 15.padH,
          child: Column(children: [
            60.sbH,
            RowRailer(
                leading: const Icon(PhosphorIconsBold.arrowLeft).tap(onTap: () {
                  goBack(context);
                }),
                rowPadding: 0.padH),
            40.sbH,
            Padding(
              padding: 10.padH,
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
                      child:
                          AppGraphics.memeoji.png.myImage(fit: BoxFit.contain)),
                ),
                15.sbW,
                Expanded(
                    child: Column(
                  children: [
                    "Mizukake Tsynami"
                        .txt16(
                            textAlign: TextAlign.left,
                            fontW: F.w6,
                            overflow: TextOverflow.ellipsis)
                        .alignCenterLeft(),
                    3.sbH,
                    "08034567782"
                        .txt16(textAlign: TextAlign.left)
                        .alignCenterLeft()
                  ],
                )),
                Icon(
                  PhosphorIconsFill.phone,
                  size: 30.h,
                ),
              ]),
            ),
            70.sbH,
            RowRailer(
                rowPadding: 0.padH,
                leading: "Rating & Reviews".txt18(
                  fontW: F.w6,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "4.5".txt14(fontW: F.w6),
                    5.sbW,
                    Icon(
                      PhosphorIconsFill.star,
                      size: 20.h,
                      color: Palette.strydeOrange,
                    ),
                    5.sbW,
                    "(256)".txt14()
                  ],
                )),
            20.sbH,
            FlutterCarousel(
              items: List.generate(10, (index) => const ReviewCard()),
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 4),
                viewportFraction: 1.0,
                initialPage: 2,
                showIndicator: false,
                height: 230.h,
                onPageChanged: (int index, CarouselPageChangedReason reason) {
                  _currentIndexNotifier.value = index;
                },
              ),
            ),
            50.sbH
          ]),
        )
      ]),
    );
  }
}
