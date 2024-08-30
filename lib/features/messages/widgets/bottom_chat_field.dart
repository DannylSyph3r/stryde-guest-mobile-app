import 'dart:io';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_constants.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:stryde_guest_app/utils/widgets/myicon.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:stark/core/enums/enums.dart';
// import 'package:stark/core/providers/message_reply_provider.dart';
// import 'package:stark/features/messaging/controllers/messaging_controller.dart';
// import 'package:stark/features/messaging/widgets/message_reply_preview.dart';
// import 'package:stark/theme/palette.dart';

class BottomChatField extends ConsumerStatefulWidget {
  const BottomChatField({
    Key? key,
    // required this.recieverUserId,
    // required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  final ValueNotifier<bool> isShowSendButton = ValueNotifier(false);
  final ValueNotifier<bool> showAdd = ValueNotifier(false);
  final TextEditingController _messageController = TextEditingController();
  // FlutterSoundRecorder? _soundRecorder;
  bool isRecorderInit = false;
  bool isShowEmojiContainer = false;
  bool isRecording = false;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // _soundRecorder = FlutterSoundRecorder();
    // openAudio();
  }

  // void openAudio() async {
  //     final status = await Permission.microphone.request();
  //     if (status != PermissionStatus.granted) {
  //       throw RecordingPermissionException('Mic permission not allowed!');
  //     }
  //     await _soundRecorder!.openRecorder();
  //     isRecorderInit = true;
  // }

  void sendTextMessage() async {
    // if (isShowSendButton) {
    // ref.read(messagingControllerProvider.notifier).sendTextMessageManager(
    //       context: context,
    //       text: _messageController.text.trim(),
    //     );
    // setState(() {
    //   _messageController.text = '';
    // });
    // } else {
    //   var tempDir = await getTemporaryDirectory();
    //   var path = '${tempDir.path}/flutter_sound.aac';
    //   if (!isRecorderInit) {
    //     return;
    //   }
    //   if (isRecording) {
    //     await _soundRecorder!.stopRecorder();
    //     sendFileMessage(File(path), MessageEnum.audio);
    //   } else {
    //     await _soundRecorder!.startRecorder(
    //       toFile: path,
    //     );
    //   }

    //   setState(() {
    //     isRecording = !isRecording;
    //   });
    // }
  }

  void sendFileMessage(
    File file,
    // MessageEnum messageEnum,
  ) {
    //   ref.read(chatControllerProvider).sendFileMessage(
    //         context,
    //         file,
    //         widget.recieverUserId,
    //         messageEnum,
    //         widget.isGroupChat,
    //       );
  }

  void selectImage() async {
    //   File? image = await pickImageFromGallery(context);
    //   if (image != null) {
    //     sendFileMessage(image, MessageEnum.image);
    //   }
  }

  void selectVideo() async {
    //   File? video = await pickVideoFromGallery(context);
    //   if (video != null) {
    //     sendFileMessage(video, MessageEnum.video);
    //   }
  }

  void selectGIF() async {
    // final gif = await pickGIF(context);
    // if (gif != null) {
    //   ref.read(chatControllerProvider).sendGIFMessage(
    //         context,
    //         gif.url,
    //         widget.recieverUserId,
    //         widget.isGroupChat,
    //       );
    // }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
    // _soundRecorder!.closeRecorder();
    isRecorderInit = false;
  }

  @override
  Widget build(BuildContext context) {
    // final messageReply = ref.watch(messageReplyProvider);
    // final isShowMessageReply = messageReply != null;
    return Container(
      width: width(context),
      decoration: BoxDecoration(
        color: Palette.buttonBG.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 7,
            offset: Offset(0, -1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          //! add stuff container
          ValueListenableBuilder(
            valueListenable: showAdd,
            builder: (context, value, child) => AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: width(context),
              height: switch (showAdd.value) {
                true => 80.h,
                false => 0,
              },
              padding:
                  EdgeInsets.symmetric(horizontal: 23.w).copyWith(top: 18.h),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    addItems.length,
                    (index) => SizedBox(
                      width: 60.w,
                      child: Column(
                        children: [
                          MyIcon(
                            icon: addItems[index].icon,
                            height: 25.h,
                          ),
                          5.sbH,
                          addItems[index].title.txt12(
                              color:
                                  (Theme.of(context).colorScheme.brightness ==
                                          Brightness.dark
                                      ? Palette.whiteColor
                                      : Palette.blackColor),
                              fontW: F.w6),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w)
                .copyWith(bottom: 24.h, top: 17.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: Ma,
              children: [
                //! add
                Padding(
                  padding: EdgeInsets.only(right: 7.w),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: showAdd,
                    builder: (context, value, child) {
                      return GestureDetector(
                        onTap: () {
                          showAdd.value = !showAdd.value;
                        },
                        child: Icon(
                          value
                              ? PhosphorIconsBold.caretDown
                              : PhosphorIconsBold.plus,
                          size: 25.sp,
                          color: Palette.strydeOrange,
                        ),
                      );
                    },
                  ),
                ),
                5.sbW,

                //! text field
                Expanded(
                  child: SizedBox(
                    height: 40.h,
                    child: TextFormField(
                      cursorColor: Palette.strydeOrange,
                      focusNode: focusNode,
                      controller: _messageController,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 12.sp,
                          color: (Theme.of(context).colorScheme.brightness ==
                                  Brightness.dark
                              ? Palette.whiteColor
                              : Palette.blackColor),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      cursorHeight: 15.h,
                      onChanged: (val) {
                        if (val.isNotEmpty) {
                          isShowSendButton.value = true;
                        } else {
                          isShowSendButton.value = false;
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Palette.greyColor,
                        hintText: 'Write a message...',
                        // hintStyle: GoogleFonts.poppins(
                        //   textStyle: TextStyle(
                        //     fontSize: 12.sp,
                        //     color: Palette.blackColor,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 15.w),
                      ),
                    ),
                  ),
                ),
                5.sbW,

                ValueListenableBuilder(
                    valueListenable: isShowSendButton,
                    builder: (context, v, c) {
                      return Padding(
                        padding: EdgeInsets.only(left: 7.w),
                        child: switch (isShowSendButton.value) {
                          true => const Icon(
                              PhosphorIconsFill.paperPlaneTilt,
                              color: Palette.strydeOrange,
                              size: 22,
                            ),
                          false => Icon(
                              PhosphorIconsFill.paperPlaneTilt,
                              size: 25.sp,
                              color: Palette.greyColor,
                            ),
                        },
                      );
                    })

                //! send/ mic
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddItem {
  final String icon;
  final String title;

  AddItem(this.icon, this.title);
}

List<AddItem> addItems = [
  AddItem('camera', 'Camera'),
  AddItem('folder', 'File'),
  AddItem('gallery', 'Gallery'),
  AddItem('map', 'Drop-off'),
  AddItem('map', 'Pick-up'),
];
