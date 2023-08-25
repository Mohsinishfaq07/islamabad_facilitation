import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_text_field.dart';
import 'package:sb_myreports/features/complaint_managemnt/presentation/manager/complain_provider.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';
import '../../../../core/widgets/custom/Custom Routes/custom_alert_dialoq.dart';

class SecurityScreen extends StatefulWidget {
  const SecurityScreen({Key? key}) : super(key: key);

  @override
  State<SecurityScreen> createState() => _SecurityScreenState();
}

class _SecurityScreenState extends State<SecurityScreen> {
  TextEditingController dateOfTravelingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController securityTypeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  ComplainProvider complainProvider = sl();

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
          appBar: getPreferedSizeAppbar("Security ", false, true),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, bottom: 18.h),
                      child: CustomTextField(
                        validator: FormValidators.validateDateOfTraveling,
                        controller: dateOfTravelingController,
                        isReadOnly: true,
                        hintText: 'dd-MM-yyyy',
                        title: "Date of travelling ",
                        fillColor: Colors.white,
                        suffix: Transform.scale(
                          scale: 0.6,
                          child: InkWell(
                            child: Image.asset(
                              AppAssets.pngsCalender,
                              height: 20,
                            ),
                            onTap: () {
                              complainProvider.selectDate(
                                  context, dateOfTravelingController);
                            },
                          ),
                        ),
                      ),
                    ),
                    CustomTextField(
                      controller: securityTypeController,
                      validator: FormValidators.validateSecurityType,
                      hintText: "Select",
                      title: "Security Type ",
                      suffix: const Icon(Icons.arrow_drop_down),
                      isReadOnly: true,
                      fillColor: Colors.white,
                      dropdownValues: const [
                        "Special",
                        "Normal",
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16.h, bottom: 3.h),
                      child: CustomTextField(
                        controller: descriptionController,
                        validator: FormValidators.validateDescription,
                        hintText: "Add Your Complain ",
                        title: "Description  ",
                        fillColor: Colors.white,
                        maxLines: 6,
                        maxlength: 300,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 56.h, bottom: 18.0),
                      child: ContinueButton(
                        text: "Submit",
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            DialogUtils.showCustomDialog(context,
                                title:
                                    "Congratulations! Successfully applied promo code.",
                                isSuccess: true);
                          } else {}
                        },
                        backgroundColor: Theme.of(context).primaryColorDark,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
