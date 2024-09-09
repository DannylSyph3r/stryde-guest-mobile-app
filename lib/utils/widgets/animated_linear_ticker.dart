import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stryde_guest_app/theme/palette.dart';

final lessonTextanimationTriggerProvider = StateProvider<bool>((ref) => false);
final resetAnimationProvider = StateProvider<bool>((ref) => false);
final pauseAnimationProvider = StateProvider<bool>((ref) => false);

class AnimatedTicker extends ConsumerStatefulWidget {
  final int animationDurationInSeconds;
  const AnimatedTicker({
    Key? key,
    required this.animationDurationInSeconds,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnimatedTickerState();
}

class _AnimatedTickerState extends ConsumerState<AnimatedTicker>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.animationDurationInSeconds),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        ref.read(lessonTextanimationTriggerProvider.notifier).state = true;
      }
    });

    // Start the animation initially
    _controller.forward();
  }

  void _resetAnimation() {
    _controller.reset();
    _controller.forward();
    ref.read(lessonTextanimationTriggerProvider.notifier).state = false;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<bool>(resetAnimationProvider, (previous, state) {
      if (previous != null && !previous && state) {
        _resetAnimation();
        ref.read(resetAnimationProvider.notifier).state = false;
      }
    });

    ref.listen<bool>(pauseAnimationProvider, (previous, state) {
      if (state) {
        _controller.stop();
      } else {
        _controller.forward();
      }
    });

    return Container(
      height: 2.h,
      width: 300.w,
      decoration: BoxDecoration(
        color: Palette.whiteColor.withOpacity(0.5),
        borderRadius: BorderRadius.all(Radius.circular(27.r)),
      ),
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Stack(
            children: [
              Container(
                width: _animation.value * 320.w,
                decoration: BoxDecoration(
                  color: Palette.strydeOrange,
                  borderRadius: BorderRadius.all(Radius.circular(18.r)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
