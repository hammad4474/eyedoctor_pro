import 'package:eyedoctor_pro/screens/chatbot_intro.dart';
import 'package:eyedoctor_pro/screens/gallery_test.dart';
import 'package:eyedoctor_pro/screens/image_test_result.dart';
import 'package:eyedoctor_pro/screens/medicines_info.dart';
import 'package:eyedoctor_pro/widgets/button_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  // Widget _getBody() {
  //   switch (_currentIndex) {
  //     case 0:
  //       return HomePage();
  //     case 1:
  //       return SearchPage();
  //     case 2:
  //       return SettingsPage();
  //     default:
  //       return HomePage();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xfface3f4),
            Color(0xff7cc0db),
            Color(0xff57a5c8),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Center(
                child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  width: 30,
                ),
                Icon(Icons.settings),
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
              height: 50,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
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
              //mainAxisAlignment: MainAxisAlignment.center,
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
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xff4497be),
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
        elevation: 5,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.file),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.comment),
            label: 'ChatBot',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.tablets),
            label: 'Medication',
          ),
        ],
        // currentIndex: _currentIndex,
        // onTap: (index) {
        //   setState(() {
        //     _currentIndex = index;
        //   });
        // },
      ),
    ));
  }
}


/*Scaffold(
  body: _getBody(),
  bottomNavigationBar: BottomNavigationBar(
    // ...
  ),
), */
