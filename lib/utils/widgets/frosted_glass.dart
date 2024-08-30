import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlass extends StatelessWidget {
  final double theWidth;
  final double theHeight;
  final Color? glassTint;
  final MainAxisAlignment? theChildAlignment;
  const FrostedGlass({
    Key? key,
    required this.theWidth,
    required this.theHeight,
    this.glassTint,
    this.theChildAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: theWidth,
      height: theHeight,
      color: glassTint ?? Colors.transparent,
      //we use Stack(); because we want the effects be on top of each other,
      //  just like layer in photoshop.
      child: Stack(
        children: [
          //blur effect ==> the third layer of stack
          BackdropFilter(
            filter: ImageFilter.blur(
              //sigmaX is the Horizontal blur
              sigmaX: 2,
              //sigmaY is the Vertical blur
              sigmaY: 2,
            ),
            //we use this container to scale up the blur effect to fit its
            //  parent, without this container the blur effect doesn't appear.
            child: Container(),
          ),
          //gradient effect ==> the second layer of stack
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.13)),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    //begin color
                    Colors.white.withOpacity(0.15),
                    //end color
                    Colors.white.withOpacity(0.05),
                  ]),
            ),
          ),
          //child ==> the first/top layer of stack
          const Center(child: SizedBox.shrink()),
        ],
      ),
    );
  }
}
