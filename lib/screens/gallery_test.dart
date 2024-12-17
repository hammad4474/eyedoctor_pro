import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:eyedoctor_pro/screens/chatbot_chat.dart';
import 'package:eyedoctor_pro/screens/chatbot_intro.dart';
import 'package:eyedoctor_pro/screens/medicines_info.dart';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:eyedoctor_pro/widgets/navogation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GalleryTest extends StatefulWidget {
  const GalleryTest({super.key});

  @override
  State<GalleryTest> createState() => _GalleryTestState();
}

class _GalleryTestState extends State<GalleryTest> {
  User? user = FirebaseAuth.instance.currentUser;

  Stream<QuerySnapshot> _fetchTestResults() {
    if (user != null) {
      String uid = user!.uid;

      return FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('testResults')
          .orderBy('date', descending: true)
          .snapshots();
    }
    return Stream.empty();
  }

  Future<void> _deleteTestResult(String documentId) async {
    if (user != null) {
      String uid = user!.uid;

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('testResults')
            .doc(documentId)
            .delete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Test result deleted successfully.'),
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete test result: $e'),
          ),
        );
      }
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
                    Center(
                      child: Text(
                        'Test Results',
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
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _fetchTestResults(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error fetching data'));
                    }
                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return Center(child: Text('No test results found'));
                    }

                    // Fetch the results
                    var testResults = snapshot.data!.docs;

                    return ListView.builder(
                      itemCount: testResults.length,
                      itemBuilder: (context, index) {
                        var testResult = testResults[index];
                        var resultData =
                            testResult.data() as Map<String, dynamic>;
                        String result = resultData['result'];
                        String date = resultData['date'];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: GestureDetector(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Delete Test Result'),
                                    content: Text(
                                        'Are you sure you want to delete this test result?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.of(context).pop();
                                          await _deleteTestResult(
                                              testResult.id);
                                        },
                                        child: Text('Delete'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                title: Text(
                                  "Result: $result",
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  "Date: $date",
                                  style: GoogleFonts.nunitoSans(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
