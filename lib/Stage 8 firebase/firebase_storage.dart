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

      String extension = file.path.split('.').last;
      
      Reference ref =
          FirebaseStorage.instance.ref().child('uploads/$filename.$extension');

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

    String? url = await uploadImage(imageFile!);

    setState(() {
      isLoading = false;
      imageUrl = url;
    });

    if (url != null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Upload successfully")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Upload failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image uplaod"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
                height: 200,
                width: double.infinity,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: imageFile != null
                    ? Image.file(
                        imageFile!,
                        fit: BoxFit.cover,
                      )
                    : Center(
                        child: Text("No image seleted"),
                      )),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: pickImage,
              icon: Icon(Icons.image),
              label: Text("Pick image"),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
              onPressed: isLoading ? null : handleUpload,
              icon: Icon(Icons.cloud_upload),
              label: isLoading
                  ? SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: Colors.white),
                    )
                  : Text("Upload"),
            ),
            SizedBox(
              height: 20,
            ),
            if (imageUrl != null)
              SelectableText(
                "Download URL:\n$imageUrl",
                style: TextStyle(fontSize: 20),
              )
          ],
        ),
      ),
    );
  }
}
