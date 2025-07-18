import 'package:stryde_guest_app/theme/palette.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FrostedGlassLoader extends StatelessWidget {
  final double theWidth;
  final double theHeight;
  final BorderRadius? theBorderRadius;
  final MainAxisAlignment? theChildAlignment;
  const FrostedGlassLoader(
      {Key? key,
      required this.theWidth,
      required this.theHeight,
      this.theBorderRadius,
      this.theChildAlignment = MainAxisAlignment.center,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: theBorderRadius ?? BorderRadius.circular(30),
      child: Container(
        width: theWidth,
        height: theHeight,
        color: Colors.black.withOpacity(0.4),
        //we use Stack(); because we want the effects be on top of each other,
        //  just like layer in photoshop.
        child: Stack(
          children: [
            //blur effect ==> the third layer of stack
            BackdropFilter(
              filter: ImageFilter.blur(
                //sigmaX is the Horizontal blur
                sigmaX: 1.1,
                //sigmaY is the Vertical blur
                sigmaY: 1.1,
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
                    children: const [
                  SpinKitFadingCircle(color: Palette.strydeOrange, size: 40,)
                ])),
          ],
        ),
      ),
    );
  }
}
