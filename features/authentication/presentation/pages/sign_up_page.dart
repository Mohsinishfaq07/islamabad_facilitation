import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/router/models/page_config.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_text_field.dart';
import '../../../../../core/router/app_state.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';
import '../../../../core/utils/validators/form_validator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController secondNameController = TextEditingController();
  TextEditingController cniCController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  String _formatCNIC(String input) {
    input = input.replaceAll('-', ''); // Remove existing dashes, if any

    final StringBuffer formatted = StringBuffer();
    final length = input.length;

    for (int i = 0; i < length; i += 1) {
      if (i == 4 || i == 12) {
        formatted.write('-');
      }

      formatted.write(input[i]);

      if (formatted.length >= 14) {
        break; // Restrict the length to exactly 14 characters (including dashes)
      }
    }

    return formatted.toString();
  }

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
          "Sign Up",
          false,
          false,
        ),
        body: Form(
          key: _formKey,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: 30.h, bottom: 20.h, left: 10.w, right: 10.w),
                    child: CustomTextField(
                      controller: firstNameController,
                      validator: FormValidators.validateFirstName,
                      hintText: 'First Name ',
                      title: "First Name",
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: CustomTextField(
                      controller: secondNameController,
                      validator: FormValidators.validateSecondName,
                      hintText: 'Second Name',
                      title: "Second Name",
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(top: 20.h, left: 10.w, right: 10.w),
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      onChange: (value) {
                        String formattedCNIC = _formatCNIC(value);
                        cniCController.value = cniCController.value.copyWith(
                          text: formattedCNIC,
                          selection: TextSelection.collapsed(
                              offset: formattedCNIC.length),
                        );
                      },
                      controller: cniCController,
                      validator: FormValidators.validateCnic,
                      hintText: 'CNIC',
                      title: "CNIC",
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 20.h, left: 10.w, right: 10.w),
                    child: CustomTextField(
                      controller: phoneController,
                      validator: FormValidators.validatePhone,
                      hintText: 'Phone Number',
                      title: "Phone Number",
                      keyboardType: TextInputType.number,
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 20.h, left: 10.w, right: 10.w),
                    child: CustomTextField(
                      controller: emailController,
                      validator: FormValidators.validateEmail,
                      hintText: 'Email',
                      title: "Email",
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: CustomTextField(
                      controller: passwordController,
                      validator: FormValidators.validateLoginPassword,
                      hintText: 'Password',
                      title: "Password",
                      fillColor: Theme.of(context).cardColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 60.h, left: 10.w, right: 10.w),
                    child: CustomTextField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      title: "Confirm Password",
                      fillColor: Theme.of(context).cardColor,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Confirm password is empty';
                        }
                        if (value != passwordController.text) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                    ),
                  ),
                  ContinueButton(
                    text: "Sign up ",
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) {
                      } else {
                        AppState appState = sl();
                        appState.goToNext(PageConfigs.dashboardPageConfig);
                      }
                    },
                    backgroundColor: Theme.of(context).primaryColorDark,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have account?",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(width: 5.w),
                      GestureDetector(
                        onTap: () {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.signInScreenPageConfig,
                              pageState: PageState.replace);
                        },
                        child: Text("LogIn",
                            style: TextStyle(
                                color: Colors.amber, fontSize: 12.sp)),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
