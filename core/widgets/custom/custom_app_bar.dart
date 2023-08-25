import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';

import '../../router/models/page_config.dart';
import '../../utils/constants/app_assets.dart';
import '../../utils/enums/page_state_enum.dart';
import '../../utils/globals/globals.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool isDashboardAppbar;
  final bool isNotification;
  final GlobalKey<ScaffoldState>? sckey;
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.sckey,
      required this.isNotification,
      required this.isDashboardAppbar,
      re})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  AppState appState = AppState();
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.isDashboardAppbar
                    ? GestureDetector(
                        onTap: () {
                          widget.sckey!.currentState!.openDrawer();
                        },
                        child: Image.asset(
                          AppAssets.pngsMenu,
                          height: 24.h,
                          width: 30.w,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 16.sp,
                        )),
                Text(widget.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 18.sp,
                        )),
                widget.isNotification
                    ? InkWell(
                        onTap: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.alertScreenPageConfig,
                              pageState: PageState.replace);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(160.r),
                              color: Colors.white),
                          child: Image.asset(
                            AppAssets.pngsNotificationBill,
                            height: 26.h,
                            width: 26.w,
                          ),
                        ),
                      )
                    : const Text(""),
              ],
            ),
          ),
        );
      },
    );
  }
}
