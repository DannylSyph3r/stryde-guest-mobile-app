import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stryde_guest_app/theme/palette.dart';
import 'package:stryde_guest_app/utils/app_extensions.dart';

class FilterSlider extends StatefulWidget {
  final double min;
  final double max;
  final double divisions;
  final Map<double, String> labels;
  final double initialValue;
  final bool iconInLabel;
  final IconData? icon;

  const FilterSlider(
      {super.key,
      required this.min,
      required this.max,
      required this.divisions,
      required this.labels,
      this.initialValue = 0,
      this.iconInLabel = false,
      this.icon});

  @override
  _FilterSliderState createState() => _FilterSliderState();
}

class _FilterSliderState extends State<FilterSlider> {
  double _currentValue = 0;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          value: _currentValue,
          min: widget.min,
          max: widget.max,
          inactiveColor: Palette.buttonBG,
          activeColor: Palette.strydeOrange,
          divisions: widget.divisions.toInt(),
          onChanged: (value) {
            setState(() {
              _currentValue = value;
            });
          },
        ),
        Padding(
          padding: 10.padH,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.labels.keys.map((level) {
              return Container(
                padding: 7.0.padA,
                decoration: BoxDecoration(
                    color: _currentValue == level
                        ? Palette.strydeOrange.withOpacity(0.8)
                        : Palette.buttonBG,
                    borderRadius: BorderRadius.circular(18.r)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    widget.labels[level]!.txt(
                      size: 11.sp,
                      fontW: _currentValue == level ? F.w6 : F.w3,
                    ),
                    Visibility(
                      visible: widget.iconInLabel,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          5.sbW,
                          Icon(
                            widget.icon ?? PhosphorIconsFill.star,
                            size: 15.h,
                            color: _currentValue == level
                                ? Palette.whiteColor
                                : Palette.strydeOrange,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
