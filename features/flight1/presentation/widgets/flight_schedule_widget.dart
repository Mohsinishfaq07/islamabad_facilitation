// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/horizontal.dart';

import '../../../../core/utils/globals/globals.dart';
import '../provider/flight_info_provider.dart';

class FlightScheduleWidget extends StatefulWidget {
  String flightNo;
  String? flightImagepath;
  String flightTotaltime;
  String flightstarttime;
  String flightendtime;
  String flightfrom;
  String flightTo;
  String fromAirportName;
  String toAirportName;
  String flightDate;
  String flightTime;
  String flightclass;
  String flightfair;
  String flightgate;
  String flightseat;
  FlightScheduleWidget({
    Key? key,
    required this.flightNo,
    this.flightImagepath,
    required this.flightTotaltime,
    required this.flightstarttime,
    required this.flightendtime,
    required this.flightfrom,
    required this.flightTo,
    required this.fromAirportName,
    required this.toAirportName,
    required this.flightDate,
    required this.flightTime,
    required this.flightclass,
    required this.flightfair,
    required this.flightgate,
    required this.flightseat,
  }) : super(key: key);
  @override
  State<FlightScheduleWidget> createState() => _FlightScheduleWidgetState();
}

class _FlightScheduleWidgetState extends State<FlightScheduleWidget> {
  FlightInfoProvider flightInfoProvider = sl();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController expiryTimeController = TextEditingController();
  double height = 0.35;
  bool isExpanded = false;
  void toggleExpanded() {
    isExpanded = !isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Card(
        borderOnForeground: true,
        shadowColor: Theme.of(context).hintColor.withOpacity(.3),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        elevation: 2.0,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          color: Theme.of(context).scaffoldBackgroundColor,
          height: MediaQuery.of(context).size.height * height,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //? Upperrow which shows  flight logo, Flight number and total hours
              upperRow(context, widget.flightImagepath, widget.flightNo,
                  widget.flightTotaltime),
              //
              //? Middlerow which shows  flight timings, Departure country and arrival country
              middleFlightTimingsRow(context, widget.flightstarttime,
                  widget.flightendtime, widget.flightfrom, widget.flightTo),
              //
              //? Will show departure and arrival airport details, flight date and time
              airportDetailsAndTimingWidget(context, widget.fromAirportName,
                  widget.toAirportName, widget.flightDate, widget.flightTime),
              //
              //? Simple Horizintal line
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: HorizontalDivider(
                    height: 1, width: MediaQuery.of(context).size.width * 0.8),
              ),
              //
              //? Lower row, Which will show flight seating details, Widget will be according to state of card [expandedn/non expanded]
              AnimatedCrossFade(
                  firstChild: nonExpandedFlightTypeWidget(
                      context, widget.flightclass, widget.flightfair),
                  secondChild: expandedFlightTypeWidget(
                      context,
                      widget.flightNo,
                      widget.flightgate,
                      widget.flightseat,
                      widget.flightclass),
                  crossFadeState: !isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 400)),

              SizedBox(
                height: 15.h,
              ),

              ContinueButton(
                text: isExpanded ? "Close" : "Check",
                onPressed: () {
                  setState(() {
                    toggleExpanded();
                    if (isExpanded) {
                      height = 0.6;
                    } else {
                      height = 0.35;
                    }
                  });
                },
                backgroundColor: Theme.of(context).primaryColorDark,
              )
            ],
          ),
        ),
      ),
    );
  }
  //!---------------------------------------------------------------------------------------------------
  //?----------------------------------------------------------------------------------------------------
  //* W I D G E T S
  //?----------------------------------------------------------------------------------------------------
  //!----------------------------------------------------------------------------------------------------

  AnimatedContainer airportDetailsAndTimingWidget(
      BuildContext context,
      String? fromAirportName,
      String? toAirportName,
      String? flightDate,
      String? flightTime) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      height: isExpanded ? 160.h : 0.h,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* First Airport Name
                  SizedBox(
                    width: 90.w,
                    child: Column(
                      children: [
                        Text(
                          fromAirportName ?? "-",
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 13.sp),
                        )
                      ],
                    ),
                  ),
                  //* Second Airport Name
                  SizedBox(
                    width: 90.w,
                    child: Column(
                      children: [
                        Text(
                          toAirportName ?? "-",
                          textAlign: TextAlign.right,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontSize: 13.sp),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              //? TIMINGS  ------------------------------------
              SizedBox(
                height: 6.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //! Flight Date
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.362,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Theme.of(context).hintColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(12.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child:
                                        const Icon(Icons.date_range_outlined),
                                    onTap: () {
                                      flightInfoProvider.selectDate(
                                          context, expiryDateController);
                                    },
                                  ),
                                  SizedBox(
                                    width: 8.w,
                                  ),
                                  ValueListenableBuilder<DateTime?>(
                                    valueListenable:
                                        flightInfoProvider.selectedDate,
                                    builder: (context, selectedDate, _) {
                                      return Text(
                                        selectedDate != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(selectedDate)
                                            : 'Select a date',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      );
                                    },
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Positioned(
                          left: 12.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            color: Colors.white,
                            child: Text(
                              'Date',
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ))
                    ],
                  ),
                  //! Flight time

                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Theme.of(context).hintColor),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(12.sp),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    child: Icon(Icons.access_time),
                                    onTap: () {
                                      flightInfoProvider.selectTime(
                                          context, expiryTimeController);
                                    },
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  ValueListenableBuilder<TimeOfDay?>(
                                    valueListenable:
                                        flightInfoProvider.selectedTime,
                                    builder: (context, selectedTime, _) {
                                      return Text(
                                        selectedTime != null
                                            ? selectedTime.format(context)
                                            : 'Select a time',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                  // GestureDetector(
                                  //     child: const Icon(Icons.access_time),
                                  // ),
                                  // SizedBox(
                                  //   width: 10.w,
                                  // ),
                                  // Text(
                                  //   flightTime ?? "-",
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .displayMedium!
                                  //       .copyWith(
                                  //           fontWeight: FontWeight.w600,
                                  //           fontSize: 12.sp),
                                  // )
                                ],
                              )),
                        ),
                      ),
                      Positioned(
                          left: 15.w,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            color: Colors.white,
                            child: const Text("Time"),
                          ))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding middleFlightTimingsRow(BuildContext context, String? flightstarttime,
      String? flightendtime, String? flightfrom, String? flightTo) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                flightstarttime ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 15.sp),
              ),
              Text(
                flightfrom ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13.sp),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                flightendtime ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 15.sp),
              ),
              Text(
                flightTo ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 11.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding upperRow(BuildContext context, String? imagepath, String? flightNo,
      String? duraion) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      child: SizedBox(
        height: 40.h,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              padding: isExpanded
                  ? EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25)
                  : const EdgeInsets.only(left: 0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                height: isExpanded ? 60.h : 30.h,
                width: isExpanded ? 80.h : 50.h,
                color: Colors.green,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isExpanded ? 0 : 1,
              child: Padding(
                padding: EdgeInsets.only(
                  left: 6.w,
                ),
                child: Text(
                  flightNo ?? "-",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: 13.sp),
                ),
              ),
            ),
            const Spacer(),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: isExpanded ? 0 : 1,
              child: Text(
                duraion ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 13.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding expandedFlightTypeWidget(BuildContext context, String? flightNo,
      String? gate, String? seatNo, String? flightClass) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Flight",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                flightNo ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gate",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                gate ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Seat",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                seatNo ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Class",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 13.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                flightClass ?? "-",
                style: Theme.of(context)
                    .textTheme
                    .displayMedium!
                    .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding nonExpandedFlightTypeWidget(
      BuildContext context, String? flightclass, String? totalfair) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.bus_alert_outlined,
                size: 16.sp,
              ),
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 2),
                child: Text(
                  flightclass ?? "-",
                  style: TextStyle(
                      fontSize: 12.sp, color: Theme.of(context).hintColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Fare  ",
                style: TextStyle(
                    fontSize: 12.sp, color: Theme.of(context).hintColor),
              ),
              Text(
                totalfair ?? "",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13.sp),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    const double trackHeight = 4.0;
    final double trackLeft = offset.dx + 8.0;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width - 16.0;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
