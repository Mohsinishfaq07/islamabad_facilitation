import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/features/dashboard/presentation/pages/profile_container.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';
import '../../../../core/utils/validators/form_validator.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_text_field.dart';
import '../../../complaint_managemnt/presentation/pages/general_complain.dart';
import '../../manager/dashboard_provider.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<EditProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController cniCController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  DashboardProvider dashboardProvider = sl();

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
          appBar: getPreferedSizeAppbar('Edit Profile', false, true),
          body: Form(
            key: _formKey,
            child: ScrollConfiguration(
              behavior: const ScrollBehavior(),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: ProfileContainerWidget(),
                    ),
                    Text(
                      'Profile Picture',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontSize: 15),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                      child: CustomTextField(
                        controller: firstNameController,
                        validator: FormValidators.validateFirstName,
                        hintText: 'Name ',
                        title: "Name",
                        fillColor: Theme.of(context).cardColor,
                      ),
                    ),
                    CustomTextField(
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validator: FormValidators.validatePhone,
                      hintText: 'Phone no',
                      title: "Phone no",
                      fillColor: Theme.of(context).cardColor,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: CustomTextField(
                        controller: emailController,
                        validator: FormValidators.validateEmail,
                        hintText: 'Email',
                        title: "Email",
                        fillColor: Theme.of(context).cardColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.h, bottom: 20.h),
                      child: CustomTextField(
                        controller: cniCController,
                        keyboardType: TextInputType.number,
                        validator: FormValidators.validateCnic,
                        hintText: 'CNIC',
                        title: "CNIC",
                        fillColor: Theme.of(context).cardColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.h),
                      child: CustomTextField(
                        controller: dateOfBirthController,
                        validator: FormValidators.validateDob,
                        hintText: 'D.O.B',
                        title: "D.O.B",
                        suffix: Transform.scale(
                          scale: 0.6,
                          child: InkWell(
                            child: Image.asset(
                              AppAssets.pngsCalender,
                              height: 20,
                            ),
                            onTap: () {
                              complainProvider.selectDate(
                                  context, dateOfBirthController);
                            },
                          ),
                        ),
                        fillColor: Theme.of(context).cardColor,
                      ),
                    ),
                    ContinueButton(
                      text: "Update",
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                        } else {
                          AppState appState = sl();
                          appState.goToNext(PageConfigs.dashboardPageConfig);
                        }
                      },
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
