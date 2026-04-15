import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

// 1. upload image

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? imageFile;
  bool isLoading = false;
  String? imageUrl;

  Future<String?> uploadImage(File file) async {
    try {
      String filename = DateTime.now().millisecondsSinceEpoch.toString();

      Reference ref =
          FirebaseStorage.instance.ref().child('/uploads/$filename.jpg');

      UploadTask uploadTask = ref.putFile(file);

      TaskSnapshot snapshot = await uploadTask;

      String downloadUrl = await snapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (err) {
      print(err);
      return null;
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) return;
    setState(() {
      imageFile = File(pickedImage.path);
    });
  }

  Future<void> handleUpload() async {
    if (imageFile == null) return;

    setState(() {
      isLoading = true;
    });
  }
}
