import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../router/custom_transition.dart';

class AppTheme {
  static BoxDecoration roundedContainerDecorationLightColor = BoxDecoration(
      // boxShadow: const [
      //   BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(2, 3))
      // ],
      borderRadius: BorderRadius.circular(35.r),
      color: const Color(0xff0071b7).withOpacity(.2));

  static BoxDecoration roundedContainerDecorationdarkColor = BoxDecoration(
      color: const Color(0xff0071b7),
      borderRadius: BorderRadius.circular(35.r));

  static ThemeData appTheme = ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CustomPageTransitionBuilder(),
        TargetPlatform.iOS: CustomPageTransitionBuilder(),
      },
    ),

    primaryColorDark: const Color(0xff0071b7), // For Buttons and Icons
    highlightColor: const Color(0xffce8908),
    canvasColor: const Color(0xffd3c9b4),
    hintColor: const Color(0xff818181),
    // Black on light theme and white on dark theme
    indicatorColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 28.h,
    ),
    // Will be used for headlines
    textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          //letterSpacing: -1.5,
          color: Colors.black,
        ),
        // Will be used for body
        displayMedium: GoogleFonts.poppins(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          //letterSpacing: -0.5,
          color: Colors.black,
        ),
        // Will be used for labels
        displaySmall: GoogleFonts.poppins(
          fontSize: 12.sp,
          color: const Color(0xff818181),
        ),
        // Will be used on Icons and buttons text
        labelMedium: GoogleFonts.poppins(
          fontSize: 14.sp,
          color: Colors.white,
          // letterSpacing: -0.5,
        )),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: const Color(0xFF000812).withOpacity(0.1),
      selectionHandleColor: const Color(0xff0071b7),
      cursorColor: const Color(0xff0071b7),
    ),

    // floatingActionButtonTheme: const FloatingActionButtonThemeData(
    //     elevation: 10, backgroundColor: Colors.white),
    // listTileTheme: const ListTileThemeData(
    //   iconColor: Color(0xFF818492),
    // ),

    inputDecorationTheme: InputDecorationTheme(
      filled: false,

      isCollapsed: false,
      // isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: const Color(0xff0071b7).withOpacity(0.2),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(
          color: Color(0xff0071b7),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(
          color: Colors.redAccent,
        ),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          side: MaterialStateProperty.resolveWith((states) {
            return null;
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xFF000812).withOpacity(0.7);
            } else {
              return const Color(0xFF000812);
            }
          }),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)))),
    ),
    // outlinedButtonTheme: OutlinedButtonThemeData(
    //   style: ButtonStyle(
    //     side: MaterialStateProperty.resolveWith((states) {
    //       if (states.contains(MaterialState.disabled)) {
    //         return BorderSide(
    //             width: 1.5, color: const Color(0xFF000812).withOpacity(0.7));
    //       } else {
    //         return const BorderSide(width: 1.5, color: Color(0xFF000812));
    //       }
    //     }),
    //     foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    //     maximumSize: MaterialStateProperty.all(Size(double.infinity, 48.h)),
    //     minimumSize: MaterialStateProperty.all(Size(64.w, 48.h)),
    //     shape: MaterialStateProperty.all<OutlinedBorder>(
    //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    //   ),
    // ),
  );
}
