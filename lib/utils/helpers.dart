import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/utils/env.dart';
import 'package:myapp/widgets/confirm_box.dart';
import 'package:uuid/uuid.dart';

void showSnackBar(String title, String msg) {
  Get.snackbar(title, msg,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.black,
      snackStyle: SnackStyle.GROUNDED,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(0));
}

Future<File?> pickImageFormGallery() async {
  const uuid = Uuid();
  final ImagePicker picker = ImagePicker();
  final XFile? file = await picker.pickImage(source: ImageSource.gallery);
  if (file == null) return null;
  final dir = Directory.systemTemp;
  final targetPath = "${dir.absolute.path}/${uuid.v6()}.jpg";
  File image = await compressImage(File(file.path), targetPath);
  return image;
}

Future<File> compressImage(File file, String targetPath) async {
  var result = await FlutterImageCompress.compressAndGetFile(
      file.path, targetPath,
      quality: 75);

  return File(result!.path);
}

String getBucketUrl(String path) {
  return "${Env.supabaseUrl}/storage/v1/object/public/$path";
}

// void confirmDialog(
//     String title, String message, String confirmText, VoidCallback onConfirm) {
//   Get.defaultDialog(
//     title: title,
//     middleText: message,
//     textCancel: 'Cancel',
//     textConfirm: confirmText,
//     onConfirm: onConfirm,
//     buttonColor: Colors.orange,
//     confirmTextColor: Colors.white,
//   );
// }

void confirmDialog(
    String title, String message, String confirmText, VoidCallback onConfirm) {
  Get.dialog(
    ConfirmBox(
      title: title,
      message: message,
      buttonText: confirmText,
      callback: onConfirm,
    ),
    barrierDismissible: false, // Prevent closing by tapping outside
  );
}
