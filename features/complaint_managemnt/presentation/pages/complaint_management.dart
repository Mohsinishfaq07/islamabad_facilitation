import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/app_state.dart';
import 'package:sb_myreports/core/utils/helper/getPreferedSizeAppbar.dart';
import 'package:sb_myreports/core/widgets/custom/custom_searchbar.dart';
import 'package:sb_myreports/features/complaint_managemnt/presentation/manager/complain_provider.dart';
import 'package:sb_myreports/features/drawer/presentation/dashboard_drawer.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/animated_button_switcher.dart';
import '../widgets/complain_details.dart';

enum SingingCharacter { action, inProgress, close }

class ComplaintManagement extends StatefulWidget {
  const ComplaintManagement({Key? key}) : super(key: key);

  @override
  State<ComplaintManagement> createState() => _ComplaintManagementState();
}

class _ComplaintManagementState extends State<ComplaintManagement> {
  bool isSelected = false;
  bool rightIsSelected = false;
  bool leftIsSelected = false;
  SingingCharacter? selectedGender;

  TextEditingController searchController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  bool showWidget = false;

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
        appBar: getPreferedSizeAppbar("Complain Management", true, true,
            scafoldKey: _scaffoldKey),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(left: 18.w, right: 20.w, top: 17.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: AnimatedButtonSwitcher(
                leftText: 'File a complain',
                righttext: 'Track a complain',
                onLeftTextSelected: () {
                  if (_currentPage > 0) {
                    _goToPage(_currentPage - 1);
                  }
                },
                onRightTextSelected: () {
                  if (_currentPage < 2) {
                    _goToPage(_currentPage + 1);
                  }
                },
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: [
                    const FileAComplain(),
                    //Container 2
                    trackComplainColumn(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget trackComplainColumn(BuildContext context) {
    ComplainProvider complainProvider = sl();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 16),
            child: CustomSearchBar(
              onSubmitted: (p0) {
                complainProvider.searchComplain(p0);
              },
              onClear: () {
                complainProvider.emptyComplainList();
              },
            ),
          ),
          ValueListenableBuilder<Complaint>(
            valueListenable: complainProvider.complaintListNotifier,
            builder:
                (BuildContext context, Complaint complaint, Widget? child) {
              if (complaint.complain_no != null) {
                return ComplainDetails(
                  description: ' i have lost 4 books ',
                  luggageWeight: ' 45 kg ',
                  dateOfTraveling: '23 march 2023 ',
                  flightNumber: complaint.complain_no!,
                  flightType: 'business',
                );
              } else {
                return SizedBox(
                  height: 80.h,
                  width: 90.w,
                  child: const Center(
                    child: Text("No Complaints found"),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class FileAComplain extends StatelessWidget {
  const FileAComplain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0, bottom: 10, top: 36.h),
          child: Text(
            "File any complaint using the following  options",
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
        Column(
          children: [
            CustomComplainOptionsCard(
              title: 'Lost Luggage',
              description:
                  'This will help you in case you have lost or\nmisplace your luggage ',
              ontap: () {
                AppState appState = sl();
                appState.goToNext(PageConfigs.lostLuggagePageConfig);
              },
              picture: Image.asset(
                AppAssets.pngsLostLuggage,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              child: CustomComplainOptionsCard(
                title: 'Security',
                description:
                    'This will help you in case  you have any security\n'
                    'related query you want to  cater to. ',
                ontap: () {
                  AppState appState = sl();
                  appState.goToNext(PageConfigs.securityScreenPageConfig);
                },
                picture: Image.asset(
                  AppAssets.pngsSecuritycamera,
                ),
              ),
            ),
            CustomComplainOptionsCard(
              title: 'General Security',
              description:
                  'In case of any other complain this will help you\nin moving forward with the problem occurred',
              ontap: () {
                AppState appState = sl();
                appState.goToNext(PageConfigs.generalComplainPageConfig);
              },
              picture: Image.asset(
                AppAssets.pngsGeneralComplain,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class CustomComplainOptionsCard extends StatelessWidget {
  const CustomComplainOptionsCard({
    Key? key,
    required this.title,
    required this.description,
    required this.ontap,
    required this.picture,
  }) : super(
          key: key,
        );
  final String? title;
  final String? description;
  final Image? picture;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            width: MediaQuery.of(context).size.width * 0.2,
            color: Theme.of(context).primaryColorDark.withOpacity(.3),
            child: picture,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.11,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10.r),
                  topRight: Radius.circular(10.r)),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 8),
                          child: Icon(
                            Icons.chevron_right,
                            size: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(title!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 13.sp)),
                  Padding(
                    padding: EdgeInsets.only(top: 6.h),
                    child: Column(
                      children: [
                        Text(
                          description!,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 10.sp),
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
