// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sb_myreports/core/utils/constants/app_assets.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/horizontal.dart';

class FlightDetailsBottomSheetContent extends StatelessWidget {
  const FlightDetailsBottomSheetContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.74,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Flight details",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w100),
              ),
              Image.asset(
                AppAssets.pngsNotificationBill,
                height: 25.h,
                width: 30.w,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: HorizontalDivider(
                height: 2.h, width: MediaQuery.of(context).size.width * 0.89),
          ),
          Text(
            "Hassan Ali",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 14.sp, fontWeight: FontWeight.w100),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: FlightDetailsWidget(
              flightAirline: "Itehad Airlines",
              flightNo: "VNA-258",
              flightfromCountryName: "Pakistan",
              flightfromTime: "7:45",
              flightfromDate: "Wed 2/2/2022",
              flightTotaltime: "1h 15 m",
              flightToCountryName: "China",
              flightToTime: "9:00",
              flightToDate: "Wed 2/2/2022",
              flightLogo: "",
              flightType: "Economy",
            ),
          ),
          FlightDelayWidget(delayduration: 20),
          Padding(
            padding: EdgeInsets.only(top: 15.h, bottom: 30.h),
            child: FlightDurationWidget(
              scheduleTime: 09.00,
              estimatedTime: 09.20,
              boardingTime: 08.20,
            ),
          ),
          ContinueButton(
              text: "Close",
              backgroundColor: Theme.of(context).primaryColorDark,
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
// ! W I D G E T S ======================================================================================
//?------------------------------------------------------------------------------------------------------
//*-------------------------------------------------------------------------------------------------------

class FlightDetailsWidget extends StatelessWidget {
  String flightAirline;
  String flightType;
  String flightNo;
  String flightLogo;

  String flightfromCountryName;
  String flightfromTime;
  String flightfromDate;

  String flightTotaltime;

  String flightToCountryName;
  String flightToTime;
  String flightToDate;
  FlightDetailsWidget({
    Key? key,
    required this.flightAirline,
    required this.flightType,
    required this.flightNo,
    required this.flightLogo,
    required this.flightfromCountryName,
    required this.flightfromTime,
    required this.flightfromDate,
    required this.flightTotaltime,
    required this.flightToCountryName,
    required this.flightToTime,
    required this.flightToDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.21,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).hintColor.withOpacity(.1)),
          borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
                width: 40.w,
                child:
                    SvgPicture.asset(AppAssets.svgsEtihad, color: Colors.red),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$flightAirline - $flightType",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Text(
                    flightNo,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: HorizontalDivider(
                height: 1, width: MediaQuery.of(context).size.width * 0.83),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flightfromCountryName,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    flightfromTime,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 11.sp, fontWeight: FontWeight.w400),
                  ),
                  // SizedBox(
                  //   height: 5.h,
                  // ),
                  Text(
                    flightfromDate,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 11.sp),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    flightTotaltime,
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 11.sp),
                  ),
                  // here a arow icon is missing
                  SizedBox(
                    height: 10,
                    width: 50.w,
                    child: SvgPicture.asset(
                      AppAssets.svgsArrow,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 100.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      flightToCountryName,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      flightToTime,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 11.sp),
                    ),
                    Text(
                      flightToDate,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 11.sp),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
// *----------------------------------------------------------------------------------------
//! F L I G H T  D E L A Y
//*------------------------------------------------------------------------------------------

class FlightDelayWidget extends StatelessWidget {
  double delayduration;
  FlightDelayWidget({
    Key? key,
    required this.delayduration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).hintColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(6.r)),
      child: Row(
        children: [
          Image.asset(
            AppAssets.pngsAlert,
            height: 20.sp,
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            "This flight got delayed for $delayduration minuites",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 11.sp),
          )
        ],
      ),
    );
  }
}
// *----------------------------------------------------------------------------------------
//! F L I G H T  D U R A T I O N
//*------------------------------------------------------------------------------------------

class FlightDurationWidget extends StatelessWidget {
  double scheduleTime;
  double estimatedTime;
  double boardingTime;
  FlightDurationWidget({
    Key? key,
    required this.scheduleTime,
    required this.estimatedTime,
    required this.boardingTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.172,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border:
              Border.all(color: Theme.of(context).hintColor.withOpacity(.2)),
          borderRadius: BorderRadius.circular(6.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Departure Time",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 13.sp),
          ),
          SizedBox(
            height: 14.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Schedule",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13),
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  scheduleTime.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Estimated",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13),
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  estimatedTime.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Boarding time",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13),
              ),
              SizedBox(
                width: 100.w,
                child: Text(
                  boardingTime.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 13),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
