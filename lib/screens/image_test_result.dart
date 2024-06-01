import 'dart:io';
import 'dart:convert';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:eyedoctor_pro/widgets/navogation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  File? _selectedImage;
  String _textResult = "Text result of the image";
  bool isLoading = false;

  // Gallery image upload function

  Future<void> _pickImageGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      await _uploadImage(_selectedImage!);
    }
  }

  // camera
  Future<void> _pickImageCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });

      await _uploadImage(_selectedImage!);
    }
  }

  // API handling function
  Future<void> _uploadImage(File image) async {
    setState(() {
      isLoading = true;
      _textResult = 'Processing disease.....';
    });

    final uri =
        Uri.parse('https://pelican-accurate-grizzly.ngrok-free.app/detect');
    final request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('image', image.path));

    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(responseData);
      final String predictedLabel = jsonResponse['predicted_label'];

      ContentType contentType;
      String title;
      String message;
      if (predictedLabel == 'Normal') {
        contentType = ContentType.success;
        title = 'Congrats';
        message = 'You don\'t have the disease';
      } else {
        contentType = ContentType.failure;
        title = 'Oops';
        message = 'Sadly you have the disease';
      }

      final snackBar = SnackBar(
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          content: AwesomeSnackbarContent(
              title: title, message: message, contentType: contentType));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // setState(() {
      //   isLoading = false;
      // });

      setState(() {
        isLoading = false;
        _textResult = predictedLabel;
      });
      print('Upload successful: $predictedLabel');
    } else {
      setState(() {
        _textResult = 'Upload failed: ${response.statusCode}';
      });
      print('Upload failed: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfface3f4),
                Color(0xff7cc0db),
                Color(0xff57a5c8),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Gallery',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: isLoading
                    ? CircularProgressIndicator()
                    : Text(
                        _textResult ?? 'Text result of the image',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 320,
                  width: 300,
                  child: _selectedImage == null
                      ? Image(
                          image: AssetImage('assets/images/Rectangle 3.png'))
                      : Image.file(_selectedImage!)),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GallerButton(
                      text: 'Gallery', onButtonPressed: _pickImageGallery),
                  const SizedBox(width: 20),
                  CameraButton(
                    text: 'Camera',
                    onButtonPressed: _pickImageCamera,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              CustomNavigator(),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
