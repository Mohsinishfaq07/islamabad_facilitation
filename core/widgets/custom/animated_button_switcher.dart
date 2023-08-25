// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sb_myreports/core/utils/theme/app_theme.dart';

class AnimatedButtonSwitcher extends StatefulWidget {
  String leftText;
  String righttext;
  Function() onLeftTextSelected;
  Function() onRightTextSelected;
  AnimatedButtonSwitcher({
    Key? key,
    required this.leftText,
    required this.righttext,
    required this.onLeftTextSelected,
    required this.onRightTextSelected,
  }) : super(key: key);

  @override
  State<AnimatedButtonSwitcher> createState() => _AnimatedButtonSwitcherState();
}

class _AnimatedButtonSwitcherState extends State<AnimatedButtonSwitcher> {
  bool rightButtonActive = false;
  bool leftButtonActive = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 55.h,
            width: MediaQuery.of(context).size.width,
            decoration: AppTheme.roundedContainerDecorationLightColor,
          ),

          ///! Left button
          IgnorePointer(
            ignoring: leftButtonActive ? true : false,
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  leftButtonActive = !leftButtonActive;
                  rightButtonActive = !rightButtonActive;
                });
                widget.onLeftTextSelected();
                // if (leftButtonActive) {

                // }
              }),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: leftButtonActive
                          ? Theme.of(context).primaryColorDark
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(35.r)),
                  child: Center(
                    child: Text(
                      widget.leftText,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 14.sp,
                              color: leftButtonActive
                                  ? Colors.white
                                  : Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
              ),
            ),
          ),
          IgnorePointer(
            ignoring: rightButtonActive ? true : false,
            child: GestureDetector(
              onTap: (() {
                setState(() {
                  rightButtonActive = !rightButtonActive;
                  leftButtonActive = !leftButtonActive;
                });
                widget.onRightTextSelected();
              }),
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 55.h,
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                      color: rightButtonActive
                          ? Theme.of(context).primaryColorDark
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(35.r)),
                  child: Center(
                    child: Text(
                      widget.righttext,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                              fontSize: 14.sp,
                              color: rightButtonActive
                                  ? Colors.white
                                  : Theme.of(context).primaryColorDark),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
