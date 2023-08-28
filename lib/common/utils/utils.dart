import 'dart:io';

import 'package:whatsapp_clone/barrel/export.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

Future<File?> pickImageFromGallery(BuildContext context)async{
  File? image;
  try {
     
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}