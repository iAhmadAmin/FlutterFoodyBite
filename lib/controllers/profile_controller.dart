import 'dart:io';

import 'package:foodybite/services/system_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _systemService = SystemService();
  File imageFile;

  void getImageFromGallery() async {
    final xfile = await _systemService.imageFromGallery();
    imageFile = File(xfile.path);
    update();
  }

  void getImageFromCamer() async {
    final xfile = await _systemService.imageFromCamera();
    try {
      imageFile = File(xfile.path);
    } catch (e) {
      print('image not clicked');
    }
    update();
  }
}
