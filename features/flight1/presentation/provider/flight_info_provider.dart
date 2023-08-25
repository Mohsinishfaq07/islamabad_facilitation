import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightInfoProvider extends ChangeNotifier {

///Date
  final ValueNotifier<DateTime?> selectedDate = ValueNotifier<DateTime?>(null);

  Future<void> selectDate(BuildContext context, TextEditingController controller) async {
  final DateTime? picked = await showDatePicker(
  context: context,
  initialDate: DateTime.now(),
  firstDate: DateTime(2000),
  lastDate: DateTime(2100),
  );

  if (picked != null) {
  controller.text = DateFormat('yyyy-MM-dd').format(picked);
  selectedDate.value = picked;
  }
  }


///Time
  final ValueNotifier<TimeOfDay?> selectedTime = ValueNotifier<TimeOfDay?>(null);

  Future<void> selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      controller.text = picked.format(context);
      selectedTime.value = picked;
    }
  }


  //
  // Future<void> selectDate(BuildContext context, TextEditingController controller) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //   );
  //
  //   if (picked != null) {
  //       controller.text = DateFormat('yyyy-MM-dd').format(picked);
  //   }
  // }

  // late TextEditingController controller;
  // Future<void> selectDate(BuildContext context, controller) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2100),
  //     builder: (context, child) {
  //       return Theme(
  //         data: Theme.of(context).copyWith(
  //           colorScheme: ColorScheme.light(
  //             primary: Theme.of(context).primaryColorDark,
  //           ),
  //         ),
  //         child: child!,
  //       );
  //     },
  //   );
  //
  //   if (picked != null) {
  //     String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
  //     controller.text = formattedDate;
  //   }
  // }
  ValueNotifier<int> flightInfoCurrentPage = ValueNotifier<int>(0);
}
