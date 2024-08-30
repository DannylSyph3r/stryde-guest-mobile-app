// import 'package:camera/camera.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:stryde_guest_app/shared/app_graphics.dart';
// import 'package:stryde_guest_app/theme/palette.dart';
// import 'package:stryde_guest_app/utils/app_extensions.dart';
// import 'package:stryde_guest_app/utils/nav.dart';
// import 'package:stryde_guest_app/utils/widgets/row_railer.dart';

// class ActiveCameraView extends ConsumerStatefulWidget {
//   final List<CameraDescription>? cameras;
//   const ActiveCameraView(this.cameras, {super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _ActiveCameraViewState();
// }

// class _ActiveCameraViewState extends ConsumerState<ActiveCameraView> {
//   late CameraController _cameraController;
//   bool _isRearCameraSelected = true;
//   bool _isFlashModeOn = false;

//   @override
//   void initState() {
//     super.initState();
//     initCamera(widget.cameras![0]);
//   }

//   @override
//   void dispose() {
//     _cameraController.dispose();
//     super.dispose();
//   }

//   void _toggleFlash() {
//     if (_isFlashModeOn) {
//       _cameraController.setFlashMode(FlashMode.off);
//       setState(() {
//         _isFlashModeOn = false;
//       });
//     } else {
//       _cameraController.setFlashMode(FlashMode.always);
//       setState(() {
//         _isFlashModeOn = true;
//       });
//     }
//   }

//   Future takePicture() async {
//     if (!_cameraController.value.isInitialized) {
//       return null;
//     }
//     if (_cameraController.value.isTakingPicture) {
//       return null;
//     }
//     try {
//       // await _cameraController.setFlashMode(FlashMode.off);
//       XFile picture = await _cameraController.takePicture();
//       // ignore: use_build_context_synchronously
//       // goTo(
//       //     context: context,
//       //     view: MediaPreviewView(
//       //       cameraPicture: picture,
//       //     ));
//     } on CameraException catch (e) {
//       'Error occured while taking picture: $e'.log();
//       return null;
//     }
//   }

//   Future initCamera(CameraDescription cameraDescription) async {
//     _cameraController =
//         CameraController(cameraDescription, ResolutionPreset.max);
//     try {
//       await _cameraController.initialize().then((_) {
//         if (!mounted) return;
//         setState(() {});
//       });
//     } on CameraException catch (e) {
//       "camera error $e".log();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaSize = MediaQuery.of(context).size;
//     final scale = _cameraController.value.isInitialized
//         ? 1 / (_cameraController.value.aspectRatio * mediaSize.aspectRatio)
//         : 1.0;
//     return Scaffold(
//       body: Stack(
//         children: [
//           if (!_cameraController.value.isInitialized)
//             Container(
//               color: Palette.blackColor,
//               child: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             ),
//           if (_cameraController.value.isInitialized)
//             ClipRect(
//               clipper: _MediaSizeClipper(mediaSize),
//               child: Transform.scale(
//                 scale: scale,
//                 alignment: Alignment.topCenter,
//                 child: CameraPreview(_cameraController),
//               ),
//             ),
//           if (_cameraController.value.isInitialized)
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     40.sbH,
//                     RowRailer(
//                       rowPadding: 25.padH,
//                       leading: Container(
//                         padding: 6.0.padA,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Palette.blackColor.withOpacity(0.3)),
//                         child: _cameraController.value.isInitialized
//                             ? Row(
//                                 mainAxisSize: MainAxisSize.min,
//                                 children: [
//                                   _isFlashModeOn
//                                       ? Icon(CupertinoIcons.bolt,
//                                               color: Palette.whiteColor,
//                                               size: 22.sp)
//                                           .tap(onTap: () {
//                                           _toggleFlash();
//                                         })
//                                       : Icon(CupertinoIcons.bolt_fill,
//                                               color: Palette.whiteColor,
//                                               size: 22.sp)
//                                           .tap(onTap: () {
//                                           _toggleFlash();
//                                         })
//                                 ],
//                               )
//                             : null,
//                       ),
//                       middle: "Turn your Camera towards your face"
//                           .txt12(color: Palette.whiteColor, fontW: F.w6),
//                       trailing: Container(
//                         padding: 6.0.padA,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Palette.blackColor.withOpacity(0.3)),
//                         child: _cameraController.value.isInitialized
//                             ? Icon(CupertinoIcons.xmark,
//                                     color: Palette.whiteColor, size: 22.sp)
//                                 .tap(onTap: () {
//                                 goBack(context);
//                               })
//                             : const SizedBox(),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     RowRailer(
//                       rowPadding: 50.padH,
//                       middle: SvgPicture.asset(
//                         AppGraphics.cameraShotTaker,
//                         width: 60.sp,
//                         height: 60.sp,
//                       ).tap(onTap: () {
//                         takePicture();
//                       }),
//                       trailing: _isRearCameraSelected
//                           ? Container(
//                               padding: 6.0.padA,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Palette.blackColor.withOpacity(0.3)),
//                               child: Icon(CupertinoIcons.arrow_2_circlepath,
//                                       color: Palette.whiteColor, size: 25.sp)
//                                   .tap(onTap: () {
//                                 setState(() => _isRearCameraSelected =
//                                     !_isRearCameraSelected);
//                                 initCamera(widget
//                                     .cameras![_isRearCameraSelected ? 0 : 1]);
//                               }),
//                             )
//                           : Container(
//                               padding: 6.0.padA,
//                               decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Palette.whiteColor.withOpacity(0.5)),
//                               child: Icon(CupertinoIcons.arrow_2_circlepath,
//                                       color: Palette.blackColor, size: 25.sp)
//                                   .tap(onTap: () {
//                                 setState(() => _isRearCameraSelected =
//                                     !_isRearCameraSelected);
//                                 initCamera(widget
//                                     .cameras![_isRearCameraSelected ? 0 : 1]);
//                               }),
//                             ),
//                     ),
//                     25.sbH,
//                   ],
//                 ),
//               ],
//             ),
//         ],
//       ),
//     );
//   }
// }

// class _MediaSizeClipper extends CustomClipper<Rect> {
//   final Size mediaSize;
//   const _MediaSizeClipper(this.mediaSize);
//   @override
//   Rect getClip(Size size) {
//     return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
//   }

//   @override
//   bool shouldReclip(CustomClipper<Rect> oldClipper) {
//     return true;
//   }
// }
