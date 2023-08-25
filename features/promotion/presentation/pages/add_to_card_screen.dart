import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sb_myreports/core/utils/helper/getPreferedSizeAppbar.dart';
import 'package:sb_myreports/core/widgets/custom/continue_button.dart';
import 'package:sb_myreports/features/promotion/presentation/manager/promotion_provider.dart';
import 'package:sb_myreports/features/promotion/presentation/widgets/add_to_card_items_widget.dart';
import 'package:sb_myreports/features/promotion/presentation/widgets/total_product_detail_widget.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';

class AddToCardScreen extends StatefulWidget {
  const AddToCardScreen({Key? key}) : super(key: key);

  @override
  State<AddToCardScreen> createState() => _AddToCardScreenState();
}

class _AddToCardScreenState extends State<AddToCardScreen> {
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
        backgroundColor: Colors.transparent,
        appBar: getPreferedSizeAppbar("Add To Cart", false, true),
        body: ChangeNotifierProvider.value(
          value: promotionProvider,
          child: ScrollConfiguration(
            behavior: const ScrollBehavior(),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
                child: Consumer<PromotionProvider>(
                    builder: (context, promotionProvider, _) {
                  return Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 28.h),
                          child: Column(
                            children: [
                              AddToCardItemsWidget(
                                itemImage: AppAssets.pngsNotification2,
                                itemName: 'Deluxe Quarter Rounder',
                                itemPrices:
                                    promotionProvider.price.toStringAsFixed(2),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              AddToCardItemsWidget(
                                itemImage: AppAssets.pngsRestaurant,
                                itemName: 'Combo Breakfast',
                                itemPrices:
                                    promotionProvider.price.toStringAsFixed(2),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TotalProductDetailWidget(
                          subTotal: '3500.00',
                          discount: '500.00',
                          total: '3000.00'),
                      SizedBox(
                        height: 25.h,
                      ),
                      ContinueButton(
                          text: 'Add Card',
                          onPressed: () {
                            AppState state = sl();
                            state.goToNext(
                                PageConfigs.checkoutItemsScreenPageConfig);
                          },
                          backgroundColor: Theme.of(context).primaryColorDark),
                    ],
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
