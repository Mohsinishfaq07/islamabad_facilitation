import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/core/widgets/custom/custom_text_field.dart';
import 'package:sb_myreports/core/widgets/custom/Custom%20Routes/custom_alert_dialoq.dart';
import 'package:sb_myreports/features/promotion/presentation/manager/promotion_provider.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/helper/getPreferedSizeAppbar.dart';

class ApplyPromoCodeScreen extends StatefulWidget {
  const ApplyPromoCodeScreen({Key? key}) : super(key: key);

  @override
  State<ApplyPromoCodeScreen> createState() => _ApplyPromoCodeScreenState();
}

class _ApplyPromoCodeScreenState extends State<ApplyPromoCodeScreen> {
  // PromotionProvider promotionProvider = sl();
  TextEditingController controller = TextEditingController();
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
            appBar: getPreferedSizeAppbar('Promotion', false, true),
            body: Consumer<PromotionProvider>(
              builder: (context, provider, _) {
                return Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                  child: Column(
                    children: [
                      CustomTextField(
                        title: 'Promo Code',
                        controller: controller,
                        hintText: 'Enter',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ContinueButton(
                        text: 'Enter',
                        backgroundColor: Theme.of(context).primaryColorDark,
                        onPressed: () => DialogUtils.showCustomDialog(context,
                            title:
                                "Congratulations! Successfully applied promo code.",
                            isSuccess: true),
                      ),
                    ],
                  ),
                );
              },
            )),
      ),
    );
  }
}
