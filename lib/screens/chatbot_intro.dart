import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyedoctor_pro/screens/chatbot_chat.dart';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ChatbotHomeScreen extends StatefulWidget {
  @override
  State<ChatbotHomeScreen> createState() => _ChatbotHomeScreenState();
}

class _ChatbotHomeScreenState extends State<ChatbotHomeScreen> {
  String? userName;

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  Future<void> _getUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        setState(() {
          userName = userDoc['name'];
        });
      }
    } catch (e) {
      print('error fetcing user name');
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
                Color(0xfffceecfa),
                Color(0xfff2fafe),
                Color(0xfffefeff),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Chatbot',
                      style: GoogleFonts.nunitoSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.supervised_user_circle)),
                          Text(
                            userName != null
                                ? "Hello, $userName!"
                                : "Loading...",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  height: 350,
                  width: 350,
                  child:
                      Image(image: AssetImage('assets/images/images 1.png'))),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Better method of creating\n & communicating',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 22,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatbotChatScreen()));
                  },
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      color: Color(0xffe2efff),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Color(0xff1f6e8d),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            height: 50,
                            child: Image(
                                image: AssetImage('assets/images/msg.png'))),
                        Text(
                          'Start New',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16),
                        ),
                        Text('Chat',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 16)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Image.asset('assets/images/Next.png')],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
