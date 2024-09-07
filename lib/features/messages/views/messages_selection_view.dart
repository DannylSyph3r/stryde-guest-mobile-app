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
  final List<Map<String, String>> allMessages = [
    {
      'name': 'Slethware Kazumi Namikazi dominictio',
      'date': 'Today',
      'time': '06:54 AM',
      'lastMessage': AppTexts.rentalGreetingText,
    },
    {
      'name': 'Slethware Kazumi',
      'date': 'Today',
      'time': '06:54 AM',
      'lastMessage': AppTexts.rentalGreetingText,
    },
  ];

  // Sample data for unread messages
  final List<Map<String, String>> unreadMessages = [];

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
                          width: 4,
                          color: Palette.strydeOrange,
                        ),
                      ),
                    ),
                    labelColor: Palette.strydeOrange,
                    unselectedLabelColor: Palette.whiteColor,
                    labelStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
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
                              Text("All", style: TextStyle(fontSize: 14.sp)),
                              SizedBox(width: 5.w),
                              Text(
                                allMessages.length.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Palette.strydeOrange,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
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
                              Text("Unread", style: TextStyle(fontSize: 14.sp)),
                              SizedBox(width: 5.w),
                              Text(
                                unreadMessages.length.toString(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Palette.strydeOrange,
                                ),
                              ),
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
          body: TabBarView(
            children: [
              _buildMessageList(allMessages),
              _buildMessageList(unreadMessages),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageList(List<Map<String, String>> messages) {
    if (messages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppGraphics.emptyMessages.png.myImage(),
          ],
        ),
      );
    }

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      itemCount: messages.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 20.h);
      },
      itemBuilder: (context, index) {
        final message = messages[index];
        return ChatMessageTile(
          name: message['name'] ?? '',
          date: message['date'] ?? '',
          time: message['time'] ?? '',
          lastMessage: message['lastMessage'] ?? '',
          profilePicture: AppGraphics.memeoji.png,
          onTileTap: () {
            goTo(context: context, view: ChatView());
          },
        );
      },
    );
  }
}
