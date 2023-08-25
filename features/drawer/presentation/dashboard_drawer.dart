// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';
import 'package:sb_myreports/core/utils/enums/page_state_enum.dart';

import '../../../core/router/models/page_config.dart';
import '../../../core/utils/globals/globals.dart';
import '../../../core/widgets/custom/close_icon_button.dart';
import '../../../core/widgets/custom/horizontal.dart';

class DashboardDrawerWidget extends StatefulWidget {
  const DashboardDrawerWidget({Key? key, required this.parentScaffoldKey})
      : super(key: key);
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  @override
  State<DashboardDrawerWidget> createState() => _DashboardDrawerWidgetState();
}

class _DashboardDrawerWidgetState extends State<DashboardDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CloseIconButton(
                    ontap: () {
                      widget.parentScaffoldKey.currentState!.closeDrawer();
                    },
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, bottom: 15.h),
                child: drawerHeader(context),
              ),
              HorizontalDivider(
                height: 1.h,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.dashboardPageConfig,
                      pageState: PageState.replace);
                },
                leading: Image.asset(
                  AppAssets.pngsHome,
                  height: 30.sp,
                ),
                title: Text(
                  "Home",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.complaintManagementPageConfig,
                      pageState: PageState.replace);
                },
                leading: Image.asset(
                  AppAssets.pngsComplaintManagment,
                  height: 30,
                ),
                title: Text(
                  "Complaint Managemet",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.promotionScreenPageConfig,
                      pageState: PageState.replace);
                },
                leading: Image.asset(
                  AppAssets.pngsPromotions,
                  height: 30,
                ),
                title: Text(
                  "Promotions",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.flightInfoPageConfig,
                      pageState: PageState.replace);
                },
                leading: Image.asset(
                  AppAssets.pngsFlightInformation,
                  height: 30,
                ),
                title: Text(
                  "Flight Information",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.alertScreenPageConfig,
                      pageState: PageState.replace);
                },
                leading: Image.asset(
                  AppAssets.pngsAlerts,
                  height: 30,
                ),
                title: Text(
                  "Alerts",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 14.sp),
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "App Version - V2.00",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 14.sp),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Logout",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14.sp),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row drawerHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.130,
          width: 80.w,
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white, // Replace with your desired border color
                  width: 2.0, // Replace with your desired border width
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.amberAccent,
                radius: 38.r,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: ClipRRect(
                    child: Column(
                      children: [
                        Image.asset(AppAssets.pngsGeneralComplain),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fatima Ali",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w900),
              ),
              Text(
                "+92 333333333",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 10),
              ),
              SizedBox(
                height: 6.h,
              ),
              InkWell(
                onTap: () {
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.editProfilePageConfig,
                      pageState: PageState.replace);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.032,
                  width: MediaQuery.of(context).size.width * 0.192,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Text(
                      "Edit Profile ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontSize: 10.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
