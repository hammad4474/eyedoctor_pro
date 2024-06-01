import 'dart:io';
import 'package:eyedoctor_pro/screens/chatbot_chat.dart';
import 'package:eyedoctor_pro/screens/chatbot_intro.dart';
import 'package:eyedoctor_pro/screens/medicines_info.dart';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:eyedoctor_pro/widgets/navogation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class GalleryTest extends StatefulWidget {
  const GalleryTest({super.key});

  @override
  State<GalleryTest> createState() => _GalleryTestState();
}

class _GalleryTestState extends State<GalleryTest> {
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
                    Center(
                      child: Text(
                        'Image',
                        style: GoogleFonts.nunitoSans(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 320,
                  width: 300,
                  child: Image(
                      image: AssetImage('assets/images/Rectangle 3.png'))),
              const SizedBox(height: 20),
              Container(
                height: 70,
                width: 320,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                    child: Text(
                  "Text result of the image",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Button_container(
                      text: 'Chatbot',
                      onButtonPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatbotHomeScreen()));
                      }),
                  const SizedBox(width: 20),
                  Button_container(
                      text: 'Medication',
                      onButtonPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MedicineScreen()));
                      }),
                ],
              ),
              const SizedBox(height: 45),
              CustomNavigator(),
            ],
          ),
        ),
      ),
    );
  }
}
