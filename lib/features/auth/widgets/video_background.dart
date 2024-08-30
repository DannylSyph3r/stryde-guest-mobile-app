import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';
import 'package:video_player/video_player.dart';

class VideoBackground extends ConsumerStatefulWidget {
  final Widget child;

  const VideoBackground({required this.child, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoBackgroundState();
}

class _VideoBackgroundState extends ConsumerState<VideoBackground> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/assets/images/video_bg.mp4')
      ..initialize().then((_) {
        setState(() {
          _isInitialized = true; // Mark as initialized
          _controller.play();
          _controller.setLooping(true);
        });
      }).catchError((error) {
        // Handle video loading error
        'Error loading video: $error'.log();
      });
  }

  @override
  void dispose() {
    _controller.pause(); // Pause instead of dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _isInitialized
            ? FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              )
            : Container(
                color: Palette.blackColor,
                child: const Center(
                  child: SpinKitFadingCircle(
                    color: Palette.strydeOrange,
                    size: 40,
                  ),
                ),
              ),
        widget.child,
      ],
    );
  }
}
