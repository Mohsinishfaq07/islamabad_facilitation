import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sb_myreports/core/widgets/custom/Custom%20Routes/custom_dialogue_box.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';
import '../../../../core/widgets/custom/custom_searchbar.dart';
import '../../../drawer/presentation/dashboard_drawer.dart';

class AlertScreen extends StatefulWidget {
  const AlertScreen({Key? key}) : super(key: key);

  @override
  State<AlertScreen> createState() => _AlertScreenState();
}

class _AlertScreenState extends State<AlertScreen> {
  TextEditingController searchController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.pngsBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: DashboardDrawerWidget(
          parentScaffoldKey: _scaffoldKey,
        ),
        appBar: getPreferedSizeAppbar("Alerts", true, true,
            scafoldKey: _scaffoldKey),
        body: Padding(
            padding: EdgeInsets.only(
              top: 18.h,
            ),
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSearchBar(
                        //  controller: searchController,
                        ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const CustomAlertsContainer(
                      flightNumber: "pk 240",
                    ),
                    const CustomAlertsContainer(
                      flightNumber: "pk 240",
                    ),
                    const CustomAlertsContainer(
                      flightNumber: "pk 240",
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: ContinueButton(
                          text: 'okay',
                          backgroundColor: Theme.of(context).primaryColorDark,
                          onPressed: () => DialogUtils.showCustomDialog(context,
                              title: 'You will now receive alerts of this ')),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

class CustomAlertsContainer extends StatefulWidget {
  const CustomAlertsContainer({
    Key? key,
    this.flightNumber,
  }) : super(key: key);

  final String? flightNumber;

  @override
  State<CustomAlertsContainer> createState() => _CustomAlertsContainerState();
}

class _CustomAlertsContainerState extends State<CustomAlertsContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.22,
          width: MediaQuery.of(context).size.width * 0.877,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 10.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 4, top: 12.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 30.h,
                            width: 40.w,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(8.r)),
                            child: Image.asset(
                              AppAssets.pngsNotificationBill,
                              height: 16,
                              width: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 6.w,
                            ),
                            child: Text(
                              widget.flightNumber!,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        AppAssets.pngsAlerts,
                        height: 27,
                        width: 27,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 24, right: 24.w),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.080,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '7:45',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16.sp),
                            ),
                            Text(
                              'Pakistan',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Transform.scale(
                              scale: 0.8,
                              child: SvgPicture.asset(
                                AppAssets.svgsFlightAlert,
                              ),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Text(
                              '01 hr 15 min ',
                              style: TextStyle(
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "9:00",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 15.sp),
                            ),
                            Text(
                              'China',
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 24, right: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppAssets.pngsEconomicClass,
                            height: 16,
                            width: 16,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 6.w, right: 2),
                            child: Text(
                              "Economic class",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  color: Theme.of(context).hintColor),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Fare ",
                            style: TextStyle(
                                fontSize: 10.sp,
                                color: Theme.of(context).hintColor),
                          ),
                          Text(
                            " 320k",
                            style: TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
