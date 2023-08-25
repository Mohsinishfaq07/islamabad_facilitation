// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ComplainProvider extends ChangeNotifier {
  List<Complaint> complaintsList = [
    Complaint(complain_no: "12", complain_title: "complain no 1"),
    Complaint(complain_no: "34", complain_title: "complain no 2"),
    Complaint(complain_no: "56", complain_title: "complain no 3"),
  ];

  ValueNotifier<Complaint> complaintListNotifier = ValueNotifier(Complaint());
  void searchComplain(String complainNo) {
    Complaint? searchedComplain;
    searchedComplain = complaintsList.firstWhere(
      (complain) => complain.complain_no == complainNo,
      orElse: () {
        return Complaint();
      },
    );
    complaintListNotifier.value = searchedComplain;
  }

  Future<void> emptyComplainList() async {
    complaintListNotifier.value = Complaint();
  }

  late TextEditingController controller;
  Future<void> selectDate(BuildContext context, controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).primaryColorDark,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      controller.text = formattedDate;
    }
  }
}

class Complaint {
  String? complain_no;
  String? complain_title;
  Complaint({
    this.complain_no,
    this.complain_title,
  });
}
