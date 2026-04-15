import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

// 1. upload image

Future<String?> uploadImage() async {
  final picker = ImagePicker();
  final pickedFIle = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFIle == null) return null;

  File file = File(pickedFIle.path);

  String filename = DateTime.now().millisecondsSinceEpoch.toString();

}
