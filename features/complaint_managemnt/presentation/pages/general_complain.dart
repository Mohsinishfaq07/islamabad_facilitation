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

class GeneralComplain extends StatefulWidget {
  const GeneralComplain({Key? key}) : super(key: key);

  @override
  State<GeneralComplain> createState() => _GeneralComplainState();
}

ComplainProvider complainProvider = sl();

class _GeneralComplainState extends State<GeneralComplain> {
  TextEditingController dateOfTravelingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController flightNoController = TextEditingController();
  TextEditingController boardingPassController = TextEditingController();
  TextEditingController noOfBagsController = TextEditingController();
  TextEditingController flightTypeController = TextEditingController();
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
          appBar: getPreferedSizeAppbar("General Complain", false, true),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 46.h, bottom: 22.h),
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
                      controller: flightTypeController,
                      validator: FormValidators.validateFlightType,
                      hintText: "Select",
                      title: "Complaint options ",
                      suffix: const Icon(Icons.arrow_drop_down),
                      isReadOnly: true,
                      fillColor: Colors.white,
                      dropdownValues: const [
                        "Special",
                        "Normal",
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 6),
                      child: CustomTextField(
                        controller: descriptionController,
                        validator: FormValidators.validateDescription,
                        hintText: "Add Your Complain ",
                        title: "Description  ",
                        maxlength: 300,
                        fillColor: Colors.white,
                        maxLines: 6,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 46.h),
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
