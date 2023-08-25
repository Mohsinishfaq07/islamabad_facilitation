import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/utils/globals/globals.dart';
import 'package:sb_myreports/core/utils/helper/getPreferedSizeAppbar.dart';
import 'package:sb_myreports/core/widgets/custom/animated_button_switcher.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/features/drawer/presentation/dashboard_drawer.dart';
import 'package:sb_myreports/features/flight1/presentation/provider/flight_info_provider.dart';
import 'package:sb_myreports/features/flight1/presentation/widgets/flight_schedule_widget.dart';
import '../../../core/utils/constants/app_assets.dart';
import '../../../core/utils/validators/form_validator.dart';
import '../../../core/widgets/custom/custom_text_field.dart';
import 'flight_details_bottom_sheet_content.dart';

class FlightInfoPage extends StatefulWidget {
  const FlightInfoPage({Key? key}) : super(key: key);

  @override
  State<FlightInfoPage> createState() => _FlightInfoPageState();
}

class _FlightInfoPageState extends State<FlightInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PageController _pageController = PageController();

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  FlightInfoProvider flightInfoProvider = sl();
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
          appBar: getPreferedSizeAppbar("Flight info", true, true,
              scafoldKey: _scaffoldKey),
          body: ChangeNotifierProvider.value(
            value: flightInfoProvider,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        AnimatedButtonSwitcher(
                          leftText: "Track your flight",
                          righttext: "Flight Schedules",
                          onLeftTextSelected: () {
                            if (flightInfoProvider.flightInfoCurrentPage.value >
                                0) {
                              _goToPage(flightInfoProvider
                                      .flightInfoCurrentPage.value -
                                  1);
                            }
                          },
                          onRightTextSelected: () {
                            if (flightInfoProvider.flightInfoCurrentPage.value <
                                2) {
                              _goToPage(flightInfoProvider
                                      .flightInfoCurrentPage.value +
                                  1);
                            }
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        ValueListenableBuilder<int>(
                          valueListenable:
                              flightInfoProvider.flightInfoCurrentPage,
                          builder: (context, flightInfoCurrentPage, child) {
                            return SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.8,
                                child: PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  pageSnapping: false,
                                  onPageChanged: (int page) {
                                    flightInfoProvider
                                        .flightInfoCurrentPage.value = page;
                                  },
                                  controller: _pageController,
                                  children: [
                                    trackFlightWidget(),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.8,
                                      child: Column(
                                        children: [
                                          FlightScheduleWidget(
                                            flightNo: "PK 230",
                                            flightTotaltime: "01 hr 15 mint",
                                            flightstarttime: "7:45",
                                            flightendtime: "9:00",
                                            flightfrom: "Pakistan",
                                            flightTo: "Chine",
                                            fromAirportName:
                                                "International Islamabad Airport",
                                            toAirportName:
                                                "Shangai Pudong International Airport",
                                            flightDate: "15/07/2022",
                                            flightTime: "09:30",
                                            flightclass: "Econmoic",
                                            flightfair: "230k",
                                            flightgate: "22",
                                            flightseat: "2B",
                                            flightImagepath: "",
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  Column trackFlightWidget() {
    return Column(
      children: [
        CustomTextField(
          title: "Full name",
          validator: FormValidators.validateFirstName,
          controller: TextEditingController(),
          hintText: "Enter",
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextField(
          title: "Contact number",
          keyboardType: TextInputType.number,
          validator: FormValidators.validatePhone,
          controller: TextEditingController(),
          hintText: "Enter",
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomTextField(
          title: "Flight number",
          keyboardType: TextInputType.number,
          validator: FormValidators.validateFlightNumber,
          maxlength: 3,
          controller: TextEditingController(),
          hintText: "Enter",
        ),
        const SizedBox(
          height: 10,
        ),
        Builder(
          builder: (context) {
            return ContinueButton(
                backgroundColor: Theme.of(context).primaryColorDark,
                text: "Track",
                onPressed: () {
                  if (!_formKey.currentState!.validate()) {
                  } else {
                    showModalBottomSheet<dynamic>(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return const FlightDetailsBottomSheetContent();
                        });
                  }
                });
          },
        )
      ],
    );
  }
}
