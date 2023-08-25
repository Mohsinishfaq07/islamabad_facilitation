import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/utils/helper/getPreferedSizeAppbar.dart';
import 'package:sb_myreports/core/utils/validators/form_validator.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/features/promotion/presentation/manager/promotion_provider.dart';

import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_text_field.dart';
import '../../../../core/widgets/custom/Custom Routes/custom_alert_dialoq.dart';

class CheckoutItemsScreen extends StatefulWidget {
  const CheckoutItemsScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutItemsScreen> createState() => _CheckoutItemsScreenState();
}

class _CheckoutItemsScreenState extends State<CheckoutItemsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController cardHolderNumberController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  PromotionProvider promotionProvider = sl();

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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: getPreferedSizeAppbar('Check Out', false, true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextField(
                  title: 'Card Holder Name',
                  keyboardType: TextInputType.number,
                  controller: cardHolderNumberController,
                  validator: FormValidators.validateName,
                  hintText: 'Enter',
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  title: 'Card Number',
                  keyboardType: TextInputType.number,
                  controller: cardNumberController,
                  validator: FormValidators.validateCardNumber,
                  hintText: 'Enter',
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  title: 'Expiry date',
                  suffix: Transform.scale(
                    scale: 0.7,
                    child: Image.asset(
                      AppAssets.pngsCalender,
                      height: 20.h,
                    ),
                  ),
                  controller: expiryDateController,
                  validator: FormValidators.validateCardExpiry,
                  hintText: 'Enter',
                  onTap: () {
                    promotionProvider.selectDate(context, expiryDateController);
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomTextField(
                  title: 'CVV',
                  controller: cvvController,
                  keyboardType: TextInputType.number,
                  validator: FormValidators.validateForLength,
                  hintText: 'Enter',
                  maxlength: 3,
                ),
                SizedBox(
                  height: 70.h,
                ),
                ContinueButton(
                  text: 'Make Payment',
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                    } else {
                      DialogUtils.showCustomDialog(
                        context,
                        title:
                            "Your order ID is 234674, Please collect your order from Counter 5 in 20 minutes",
                        isSuccess: true,
                      );
                    }
                  },
                  backgroundColor: Theme.of(context).primaryColorDark,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
