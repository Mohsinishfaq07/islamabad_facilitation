import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_otp_fields.dart';
import 'package:sb_myreports/core/widgets/custom/horizontal.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/constants/app_assets.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();

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
        appBar: AppBar(
          centerTitle: true,
          toolbarHeight: 50.h,
          title: Text(
            "Otp screen",
            style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.h, bottom: 10),
              child: Text("Please Enter Verification number ",
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontSize: 20.sp)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalDivider(height: 1.h, width: 100.w),
                  Padding(
                    padding: EdgeInsets.all(10.h),
                    child: const Text(" OR "),
                  ),
                  HorizontalDivider(height: 1.h, width: 100.w),
                ],
              ),
            ),
            Text(
              "provide Otp provided on your phone number/Email ",
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
            //   child: CustomTextField(
            //     controller: phoneController,
            //     validator: FormValidators.validatePhone,
            //     maxlength: 11,
            //     hintText: 'Phone Number',
            //     title: "Phone number",
            //     keyboardType: TextInputType.number,
            //     fillColor: Theme.of(context).cardColor,
            //   ),
            // ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: CustomOtpFields(
                onChanged: (String) {},
                controller: otpController,
              ),
            ),

            ContinueButton(
              text: "Verify",
              onPressed: () {
                AppState appState = sl();
                appState.goToNext(PageConfigs.dashboardPageConfig);
              },
              backgroundColor: Theme.of(context).primaryColorDark,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Keep calm it can take upto 1 minute ",
              style: TextStyle(color: Colors.grey, fontSize: 12.sp),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 12.sp),
                ),
                InkWell(
                  onTap: () {
                    AppState appState = sl();
                    appState.goToNext(PageConfigs.signInScreenPageConfig);
                  },
                  child: Text("LogIn",
                      style: TextStyle(
                          color: Theme.of(context).highlightColor,
                          fontSize: 12.sp)),
                ),
              ],
            ),
            SizedBox(height: 6.h),
          ],
        ),
      ),
    );
  }
}
