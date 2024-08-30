import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stryde_guest_app/features/messages/views/chat_view.dart';
import 'package:stryde_guest_app/features/messages/widgets/chat_message_tile.dart';
import 'package:stryde_guest_app/shared/app_graphics.dart';
import 'package:stryde_guest_app/shared/app_texts.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/nav.dart';
import 'package:stryde_guest_app/utils/widgets/sliver_appbar.dart';

class MessagesSelectionView extends ConsumerStatefulWidget {
  const MessagesSelectionView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MessagesSelectionViewState();
}

class _MessagesSelectionViewState extends ConsumerState<MessagesSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverwareAppBar(
                appBarToolbarheight: 55.h,
                sliverCollapseMode: CollapseMode.parallax,
                isPinned: true,
                canStretch: false,
                isFloating: true,
                customizeLeadingWidget: false,
                showLeadingIconOrWidget: false,
                titleCentered: true,
                isTitleAWidget: false,
                title: "Messages",
                titleFontSize: 20.sp,
                titleFontWeight: FontWeight.w100,
                sliverBottom: AppBar(
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 0,
                  toolbarHeight: 60.h,
                  title: TabBar(
                    padding: EdgeInsets.zero,
                    tabAlignment: TabAlignment.center,
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Palette.strydeOrange,
                        ),
                      ),
                    ),
                    labelColor: Palette.strydeOrange,
                    unselectedLabelColor: Palette.whiteColor,
                    labelStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    unselectedLabelStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(fontSize: 16.sp),
                    ),
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "All".txt(size: 14.sp),
                              5.sbW,
                              "8".txt(
                                  size: 14.sp,
                                  color: Palette.strydeOrange,
                                  fontW: F.w6),
                            ],
                          ),
                        ),
                      ),
                      Tab(
                        child: SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Unread".txt(size: 14.sp),
                              5.sbW,
                              "5".txt(size: 14.sp, color: Palette.strydeOrange),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ];
          },
          body: TabBarView(children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return 20.sbH;
              },
              itemBuilder: (context, index) {
                return ChatMessageTile(
                  name: "Slethware Kazumi Namikazi dominictio",
                  date: "Today",
                  time: "06:54 AM",
                  lastMessage: AppTexts.rentalGreetingText,
                  profilePicture: AppGraphics.memeoji.png,
                  onTileTap: () {
                    goTo(context: context, view: ChatView());
                  },
                );
              },
            ),
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              itemCount: 10,
              separatorBuilder: (context, index) {
                return 20.sbH;
              },
              itemBuilder: (context, index) {
                return ChatMessageTile(
                  name: "Slethware Kazumi",
                  date: "Today",
                  time: "06:54 AM",
                  lastMessage: AppTexts.rentalGreetingText,
                  profilePicture: AppGraphics.memeoji.png,
                  onTileTap: () {
                    goTo(context: context, view: ChatView());
                  },
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
