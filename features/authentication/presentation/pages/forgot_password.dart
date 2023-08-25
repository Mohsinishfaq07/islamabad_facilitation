import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';

import '../../../../../core/router/app_state.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';
import '../../../../core/utils/validators/form_validator.dart';
import '../../../../core/widgets/custom/custom_text_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

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
        appBar: getPreferedSizeAppbar(
          "Forgot Password",
          false,
          false,
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 36, bottom: 6.h),
                child: Text("Your Password will recoverd  ",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 20.sp)),
              ),
              Text(
                "please  provide Your email to verify ",
                style: TextStyle(color: Colors.grey, fontSize: 12.sp),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 30.h, bottom: 10.h, left: 10.w, right: 10.w),
                child: CustomTextField(
                  controller: phoneController,
                  validator: FormValidators.validateEmail,
                  hintText: 'Email',
                  title: 'Email',
                ),
              ),
              ContinueButton(
                text: "Verify",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AppState appState = sl();
                    appState.goToNext(PageConfigs.otpScreenPageConfig);
                  }
                },
                backgroundColor: Theme.of(context).primaryColorDark,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? ",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 12.sp)),
                  InkWell(
                    onTap: () {
                      AppState appState = sl();
                      appState.goToNext(PageConfigs.signInScreenPageConfig,
                          pageState: PageState.replace);
                    },
                    child: Text("Log In",
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
      ),
    );
  }
}
