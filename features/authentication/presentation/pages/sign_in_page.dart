import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_text_field.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/validators/form_validator.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        appBar: AppBar(
          toolbarHeight: 60,
          centerTitle: true,
          title: Text(
            "Sign In",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 16.sp,
                ),
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 22.h, bottom: 4.h),
                  child: Text("Welcome back",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 20.sp)),
                ),
                Text(
                  "Please enter your account here",
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 13.sp),
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.h, right: 10.w, left: 10),
                  child: CustomTextField(
                    controller: emailController,
                    validator: FormValidators.validateEmail,
                    hintText: 'Email',
                    title: "Email",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.w, right: 10.w),
                  child: CustomTextField(
                    isPasswordField: true,
                    controller: passwordController,
                    validator: FormValidators.validateLoginPassword,
                    hintText: 'Password',
                    title: "Password",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.h, right: 26.w, bottom: 46),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            AppState appState = sl();

                            appState
                                .goToNext(PageConfigs.forgotPasswordPageConfig);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 12.sp),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ContinueButton(
                  text: "Sign in ",
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                    } else {
                      AppState appState = sl();
                      appState.goToNext(PageConfigs.dashboardPageConfig);
                    }
                  },
                  backgroundColor: Theme.of(context).primaryColorDark,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 12.sp)),
                    InkWell(
                      onTap: () {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.signUpScreenPageConfig);
                      },
                      child: const Text("Sign Up",
                          style: TextStyle(color: Colors.amber, fontSize: 12)),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
