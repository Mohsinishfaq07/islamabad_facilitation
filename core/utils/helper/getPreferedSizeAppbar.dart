import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sb_myreports/core/widgets/custom/custom_app_bar.dart';

PreferredSize getPreferedSizeAppbar(
    String title, bool isDashboardAppbar, bool isNotification,
    {dynamic scafoldKey}) {
  return PreferredSize(
      child: CustomAppBar(
        title: title,
        isNotification: isNotification,
        isDashboardAppbar: isDashboardAppbar,
        sckey: scafoldKey,
      ),
      preferredSize: Size.fromHeight(120.h));
}
