import 'package:flutter/material.dart';
import 'package:foodybite/constants/colors.dart';
import 'package:foodybite/constants/consts.dart';
import 'package:get/get.dart';

class MDialogs {
  static Future<void> confirmationDialog({
    @required String title,
    @required VoidCallback onYesTap,
    @required VoidCallback onNoTap,
  }) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: title,
        titleStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        titlePadding: const EdgeInsets.fromLTRB(
          defaultPadding * 1.5,
          defaultPadding * 2,
          defaultPadding * 1.5,
          defaultPadding * 2,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onNoTap,
              child: const Text(
                'No',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: onYesTap,
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }

  static Future<void> menuDialog({
    @required VoidCallback onEditTap,
    @required VoidCallback onDeleteTap,
  }) {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: '',
        titlePadding: const EdgeInsets.all(0),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: onEditTap,
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            GestureDetector(
              onTap: onDeleteTap,
              child: const Text(
                'Delete',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding * 2),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }

  static Future<void> imagePickerDialog() {
    return Get.defaultDialog(
        barrierDismissible: false,
        title: 'Upload profile photo',
        titleStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 1.5,
        ),
        titlePadding: const EdgeInsets.fromLTRB(
          defaultPadding * 1.5,
          defaultPadding * 2,
          defaultPadding * 1.5,
          defaultPadding * 2,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              child: const Text(
                'No',
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              child: const Text(
                'Yes',
                style: TextStyle(
                  fontSize: 16,
                  color: primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ));
  }
}
