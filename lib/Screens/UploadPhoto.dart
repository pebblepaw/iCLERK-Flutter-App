import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({Key? key}) : super(key: key);

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  Image photo = const Image(
    image: AssetImage('assets/images/upload.png'),
    height: 150,
    width: 150,
  );

  late String result;
  File? _image;
  final ImagePicker picker = ImagePicker();

  Future pickImageFromGallery() async {
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        photo = Image.file(
          _image!,
          fit: BoxFit.cover,
        );
      }
    });
  }

  Future captureImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        _image = File(pickedFile.path);
        photo = Image.file(
          _image!,
          fit: BoxFit.cover,
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Photo"),
        backgroundColor: const Color(0xFF19294E),
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 300,
                color: const Color(0xFF19294E),
                child: photo,
              ),
            ],
          ),
          Positioned(
            top: 280,
            left: 50,
            right: 50,
            child: FloatingActionButton.extended(
              heroTag: "btn1",
              onPressed: captureImageFromCamera,
              highlightElevation: 8,
              backgroundColor: const Color(0xFFF6A14A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),

              label: RichText(
                text: const TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    WidgetSpan(
                      child: Text(
                        '  Use Camera',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ),
          ),
          const Positioned(
            top: 340,
            left: 140,
            right: 50,
            child:  Text(
              '------ or ------',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
           Positioned(
            top: 356,
            left: 50,
            right: 50,
            child:  TextButton(
              onPressed: pickImageFromGallery,
              child: const Text(
                'Upload from library',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Positioned(
            top: 450,
            left: 140,
            right: 140,
            child:  FloatingActionButton(

              heroTag: "btn3",
              backgroundColor: const Color(0xC319294E),
              elevation: 0,
              onPressed: () => Navigator.pop(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text('Submit', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}