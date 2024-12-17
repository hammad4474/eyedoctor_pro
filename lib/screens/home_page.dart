import 'package:eyedoctor_pro/auth/login_screen.dart';
import 'package:eyedoctor_pro/screens/chatbot_intro.dart';
import 'package:eyedoctor_pro/screens/gallery_test.dart';
import 'package:eyedoctor_pro/screens/image_test_result.dart';
import 'package:eyedoctor_pro/screens/medicines_info.dart';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:eyedoctor_pro/widgets/navogation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Text(content, style: TextStyle(fontSize: 16)),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK', style: TextStyle(color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }

  void showCreditsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Credits',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  // Developer Section
                  Row(
                    children: [
                      Icon(Icons.code, color: Colors.green, size: 24),
                      SizedBox(width: 10),
                      Text(
                        'Developers:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Hammad',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'SP21-BCS-010',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blue, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Faraidon',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'SP21-BCS-005',
                      style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Supervisor Section
                  Row(
                    children: [
                      Icon(Icons.supervisor_account,
                          color: Colors.orange, size: 24),
                      SizedBox(width: 10),
                      Text(
                        'Supervisor:',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(Icons.person, color: Colors.blueGrey, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Mr. Armughan',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Close Button
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff4497be),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close',
                          style: TextStyle(fontSize: 16, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff4497be),
                ),
                child: Text(
                  'Settings',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                )),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('Disclaimer'),
              onTap: () {
                _showDialog(
                  context,
                  'Disclaimer',
                  'This app is currently in its development phase and aims to provide AI-driven health insights, specifically for eye care. However, it is important to note that the results generated by this app are based on machine learning models, which might not always produce accurate outcomes. Users are advised to use the results as a supplementary guide rather than definitive medical advice.\n\n'
                      'While every effort has been made to train the AI models with reliable data, there is always a possibility of false positive or false negative results due to inherent limitations in AI algorithms. Factors such as image quality, lighting conditions, and user-specific variations can also impact the accuracy of the results.\n\n'
                      'By using this app, you acknowledge that the developers and stakeholders of Eye Doctor Pro are not responsible for any decisions made based on the app\'s outputs. Always consult a certified healthcare professional for accurate diagnoses and treatment plans. Your health and safety remain our utmost priority as we continue to enhance the app for better reliability and performance.',
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.policy),
              title: Text('Privacy Policy'),
              onTap: () {
                _showDialog(
                  context,
                  'Privacy Policy',
                  'Eye Doctor Pro respects your privacy and is committed to protecting your personal information. The app collects limited data to provide a better user experience, including data related to app performance and user interactions. Rest assured, this data is handled with the highest level of security and confidentiality.\n\n'
                      'The information collected will never be sold, shared, or disclosed to third parties without your explicit consent. Any data you provide, such as images or health-related inputs, will be processed locally or securely transmitted to our servers solely for the purpose of providing AI-driven results. We employ encryption and secure storage practices to safeguard your data at every step.\n\n'
                      'By using this app, you agree to the collection of necessary data to enhance app functionality and accuracy. You have the right to review and delete your data at any time by contacting our support team. Our Privacy Policy reflects our commitment to transparency, and we continuously strive to update our practices to meet global data protection standards.',
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.star_border_rounded),
              title: Text('Credits'),
              onTap: () {
                showCreditsDialog(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xfface3f4),
            Color(0xff7cc0db),
            Color(0xff57a5c8),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
                child: Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: Icon(Icons.settings),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  "Eye Doctor Pro",
                  style: GoogleFonts.nunitoSans(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Complete \nHealth \nSolution",
                style: GoogleFonts.nunitoSans(
                  fontSize: 37,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Eye Protection",
                style: GoogleFonts.nunitoSans(
                  fontSize: 23,
                  color: Color(0xff68787f),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button_container(
                    text: 'Take a test',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageScreen()));
                    }),
                Button_container(
                    text: 'Chatbot',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatbotHomeScreen()));
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button_container(
                    text: 'Past result',
                    onButtonPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GalleryTest()));
                    }),
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
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    ));
  }
}
