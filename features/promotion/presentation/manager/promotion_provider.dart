import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PromotionProvider extends ChangeNotifier {
  int itemCount = 1;
  double price = 10.0;
  late VoidCallback onTap;
  void increment() {
    itemCount++;
    updatePrice();
    notifyListeners();
  }

  void decrement() {
    if (itemCount > 1) {
      itemCount--;
      updatePrice();
      notifyListeners();
    }
  }

  void updatePrice() {
    price = 10.0 * itemCount;
  }

  //! ----- Pic Attachment ---------------------------
  bool isAttachmentAdded = false;
  //File? selectedImage;

  // Future<void> chooseImageFromCamera(type) async {
  //   XFile? image;
  //   isAttachmentAdded = false;
  //   image = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //   );
  //
  //   if (image != null) {
  //     selectedImage = File(image.path);
  //     isAttachmentAdded = true;
  //     print(selectedImage!.path);
  //
  //     // base64Image = base64Encode(selectImage!.readAsBytesSync());
  //   }
  // }

  // File? selectImage;
  // String base64Image = "";
  // Future<void> chooseImage(type) async {
  //   XFile? image;
  //   if (type == "camera") {
  //     image = await ImagePicker().pickImage(
  //       source: ImageSource.camera,
  //     );
  //   } else {
  //     image = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //     );
  //   }
  //
  //   if (image != null) {
  //     selectImage = File(image.path);
  //     base64Image = base64Encode(selectImage!.readAsBytesSync());
  //     notifyListeners();
  //   }
  // }

  File? selectedImage;
  String base64Image = "";
  Future<void> chooseImage(String type) async {
    XFile? image;
    if (type == "camera") {
      image = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      image = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (image != null) {
      selectedImage = File(image.path);
      base64Image = base64Encode(selectedImage!.readAsBytesSync());
      notifyListeners();
    }
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
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      controller.text = formattedDate;
    }
  }
}
