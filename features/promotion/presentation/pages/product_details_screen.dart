import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/utils/helper/getPreferedSizeAppbar.dart';
import 'package:sb_myreports/features/promotion/presentation/widgets/display_items_widget.dart';
import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../widgets/custom_suggestion_searchbar.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
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
        appBar: getPreferedSizeAppbar('Mcdonalds', false, true),
        body: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSearchSuggestionBar(),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r)),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            AppAssets.pngsBanner,
                            fit: BoxFit.fill,
                          ))),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('Most Popular',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 15.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      itemBuilder: (context, position) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: DisplayItemsWidget(
                            image: AppAssets.pngsNotification2,
                            title: 'Icecream Bar',
                            subtitle: 'Organic',
                            onTap: () {
                              AppState state = sl();
                              state.goToNext(
                                  PageConfigs.addToCardScreenPageConfig);
                            },
                            price: '2225',
                            starImage: AppAssets.pngs5Star,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text('Best Combos',
                      style: Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 15.sp)),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      DisplayItemsWidget(
                        image: AppAssets.pngsRestaurant,
                        title: 'Icecream Bar',
                        subtitle: 'Organic',
                        onTap: () {},
                        price: '2',
                        starImage: AppAssets.pngs5Star,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      DisplayItemsWidget(
                        image: AppAssets.pngsRestaurant,
                        title: 'Icecream Bar',
                        subtitle: 'Organic',
                        onTap: () {},
                        price: '2',
                        starImage: AppAssets.pngs5Star,
                      ),
                    ],
                  )
                  // Container(
                  //   height: MediaQuery.of(context).size.height* 0.38,
                  //     child: GridView.builder(
                  //       itemCount: 20,
                  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           crossAxisSpacing: 11.w,
                  //           mainAxisSpacing: 10.h),
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return Padding(
                  //           padding: const EdgeInsets.only(right: 8.0),
                  //           child: DisplayItemsWidget(
                  //             image: AppAssets.pngsRestaurant,
                  //             title: 'Icecream Bar',
                  //             subtitle: 'Organic',
                  //             onTap: () {},
                  //             price: '2',
                  //             starImage: AppAssets.pngs5Star,
                  //           ),
                  //         );
                  //       },
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
