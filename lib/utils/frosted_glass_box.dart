import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedGlassBox extends StatelessWidget {
  final double theWidth;
  final double theHeight;
  final MainAxisAlignment? theChildAlignment;
  final Widget theChild;
  const FrostedGlassBox(
      {super.key,
      required this.theWidth,
      required this.theHeight,
      this.theChildAlignment = MainAxisAlignment.center,
      required this.theChild});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: theWidth,
      height: theHeight,
      color: Colors.transparent,
      //we use Stack(); because we want the effects be on top of each other,
      //  just like layer in photoshop.
      child: Stack(
        children: [
          //blur effect ==> the third layer of stack
          BackdropFilter(
            filter: ImageFilter.blur(
              //sigmaX is the Horizontal blur
              sigmaX: 3.5,
              //sigmaY is the Vertical blur
              sigmaY: 3.5,
            ),
            //we use this container to scale up the blur effect to fit its
            //  parent, without this container the blur effect doesn't appear.
            child: Container(),
          ),
          //gradient effect ==> the second layer of stack
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
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
          Center(
              child: Column(
                  mainAxisAlignment: theChildAlignment!,
                  children: [theChild])),
        ],
      ),
    );
  }
}
