import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_text_field.dart';
import 'package:sb_myreports/features/complaint_managemnt/presentation/manager/complain_provider.dart';
import 'package:sb_myreports/features/promotion/presentation/manager/promotion_provider.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';
import '../../../../core/widgets/custom/Custom Routes/custom_alert_dialoq.dart';
import '../../../drawer/presentation/dashboard_drawer.dart';

class LostLuggage extends StatefulWidget {
  const LostLuggage({Key? key}) : super(key: key);

  @override
  State<LostLuggage> createState() => _LostLuggageState();
}

class _LostLuggageState extends State<LostLuggage> {
  TextEditingController dateOfTravelingController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController flightNoController = TextEditingController();
  TextEditingController boardingPassController = TextEditingController();
  TextEditingController noOfBagsController = TextEditingController();
  TextEditingController flightTypeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  ComplainProvider complainProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PromotionProvider(),
      child: Container(
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
          appBar: getPreferedSizeAppbar("Lost Luggage", false, true,
              scafoldKey: _scaffoldKey),
          body: Consumer<PromotionProvider>(
            builder: (context, provider, _) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: ScrollConfiguration(
                  behavior: const ScrollBehavior(),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 20.h, bottom: 18.h),
                            child: CustomTextField(
                              controller: dateOfTravelingController,
                              validator: FormValidators.validateDateOfTraveling,
                              isReadOnly: true,
                              hintText: "dd-MM-yyyy",
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
                            controller: boardingPassController,
                            validator: FormValidators.validateBoardingPass,
                            hintText: provider.selectedImage == null
                                ? "Attach"
                                : File(provider.selectedImage!.path)
                                    .uri
                                    .pathSegments
                                    .last,
                            title: "Boarding pass ",
                            fillColor: Colors.white,
                            isReadOnly: true,
                            suffix: Transform.scale(
                              scale: 0.38,
                              child: InkWell(
                                child: SvgPicture.asset(
                                  AppAssets.svgsAttachment,
                                ),
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        color: Colors.white,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              TextButton(
                                                  onPressed: () {
                                                    provider
                                                        .chooseImage("camera");
                                                  },
                                                  child: const Text('Camera',
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .bold))),
                                              TextButton(
                                                  onPressed: () {
                                                    provider
                                                        .chooseImage("Gallery");
                                                  },
                                                  child: const Text(
                                                    'Gallery',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 14.h, bottom: 18.h),
                            child: CustomTextField(
                              controller: flightNoController,
                              validator: FormValidators.validateFlightNumber,
                              hintText: "Enter",
                              title: "Flight number",
                              fillColor: Colors.white,
                            ),
                          ),
                          CustomTextField(
                            validator: FormValidators.validateBags,
                            controller: noOfBagsController,
                            hintText: "Select options",
                            title: "No of Bags",
                            fillColor: Colors.white,
                            isReadOnly: true,
                            suffix: Icon(
                              Icons.arrow_drop_down,
                              color: Theme.of(context).primaryColorDark,
                            ),
                            dropdownValues: const [
                              "Select options",
                              "1",
                              "2",
                              "3",
                              "4",
                              "5"
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 14.h, bottom: 18.h),
                            child: CustomTextField(
                              validator: FormValidators.validateFlightType,
                              controller: flightTypeController,
                              hintText: "Select",
                              title: "Flight type ",
                              suffix: const Icon(Icons.arrow_drop_down),
                              isReadOnly: true,
                              fillColor: Colors.white,
                              dropdownValues: const [
                                "Business",
                                "Economic",
                                "normal",
                              ],
                            ),
                          ),
                          CustomTextField(
                            controller: weightController,
                            validator: FormValidators.validateLuggageWeight,
                            hintText: "1kg",
                            title: "Luggage weight  ",
                            fillColor: Colors.white,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 14.h, bottom: 3.h),
                            child: CustomTextField(
                              validator: FormValidators.validateDescription,
                              controller: descriptionController,
                              hintText: "Add Your Complain ",
                              title: "Description  ",
                              fillColor: Colors.white,
                              maxLines: 6,
                              maxlength: 300,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 6.h, bottom: 18.h),
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
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
