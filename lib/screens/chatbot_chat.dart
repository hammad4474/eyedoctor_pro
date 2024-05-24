import 'package:eyedoctor_pro/widgets/chat_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatbotChatScreen extends StatefulWidget {
  const ChatbotChatScreen({super.key});

  @override
  State<ChatbotChatScreen> createState() => _ChatbotChatScreenState();
}

class _ChatbotChatScreenState extends State<ChatbotChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color(0xfface3f4),
              Color.fromARGB(255, 113, 174, 198),
              Color.fromARGB(255, 81, 147, 178),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Material(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: Container(
                    height: 104,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(Icons.arrow_back),
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: ListTile(
                              leading: const CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage('assets/images/Ellipse 3.png'),
                              ),
                              title: Text(
                                'Chatbot',
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              subtitle: const Text(
                                ". Online",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              AssetImage('assets/images/images 3.png'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
                  // physics: NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  shrinkWrap: true,
                  reverse: true,
                  itemBuilder: (context, index) {
                    return index % 2 == 0
                        ? Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              ChatCard(fromSender: true),
                            ],
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
                              ChatCard(fromSender: false),
                            ],
                          );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Color(0xff89bfd7),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 320.0,
                        //   height: 50.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: 'Type Something',
                              hintStyle: TextStyle(fontSize: 20),
                              fillColor: Color(0xffd9e8ef),
                              focusColor: Color(0xffd9e8ef),
                              filled: true,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(40),
                              )),
                        ),
                      ),
                      Container(
                          height: 62,
                          width: 62,
                          decoration: BoxDecoration(
                              color: Color(0xff4698be),
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                              color: Colors.white,
                              FontAwesomeIcons.longArrowAltRight)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
