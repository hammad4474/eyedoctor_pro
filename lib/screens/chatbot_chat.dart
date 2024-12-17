import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class ChatbotChatScreen extends StatefulWidget {
  const ChatbotChatScreen({super.key});

  @override
  State<ChatbotChatScreen> createState() => _ChatbotChatScreenState();
}

class _ChatbotChatScreenState extends State<ChatbotChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  final String _chatbotApiUrl =
      "https://pelican-accurate-grizzly.ngrok-free.app/query";

  String _userId = DateTime.now().millisecondsSinceEpoch.toString();
  bool isTyping = false;

  Future<void> _sendMessage() async {
    final userMessage = _messageController.text.trim();
    if (userMessage.isEmpty) return;

    setState(() {
      _messages.insert(0, {"fromSender": true, "text": userMessage});
      _messageController.clear();
      isTyping = true;
    });

    try {
      final response = await http.post(
        Uri.parse(_chatbotApiUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "query": userMessage,
          "user_id": _userId,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final chatbotResponse = responseData["response"];
        setState(() {
          _messages.insert(0, {"fromSender": false, "text": chatbotResponse});
        });
      } else {
        setState(() {
          _messages.insert(0, {
            "fromSender": false,
            "text": "Sorry, I couldn't process your request. Try again later."
          });
        });
      }
    } catch (error) {
      setState(() {
        _messages.insert(0, {
          "fromSender": false,
          "text": "Error connecting to the server. Check your connection."
        });
      });
    } finally {
      setState(() {
        isTyping = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfface3f4),
                Color.fromARGB(255, 113, 174, 198),
                Color.fromARGB(255, 81, 147, 178),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Material(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
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
                        ),
                      ),
                      const SizedBox(width: 20),
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
                          ),
                        ),
                      ),
                      const SizedBox(width: 60),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: _messages.length,
                        reverse: true,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final message = _messages[index];
                          return Row(
                            mainAxisAlignment: message["fromSender"]
                                ? MainAxisAlignment.end
                                : MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                padding: const EdgeInsets.all(12),
                                constraints: BoxConstraints(
                                  maxWidth:
                                      MediaQuery.of(context).size.width * 0.7,
                                ),
                                decoration: BoxDecoration(
                                  color: message["fromSender"]
                                      ? const Color(0xff4698be)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Text(
                                  message["text"],
                                  style: TextStyle(
                                    color: message["fromSender"]
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      if (isTyping)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(),
                            ],
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _messageController,
                                decoration: InputDecoration(
                                  hintText: 'Type Something',
                                  hintStyle: const TextStyle(fontSize: 20),
                                  fillColor: const Color(0xffd9e8ef),
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: _sendMessage,
                              child: Container(
                                height: 62,
                                width: 62,
                                decoration: BoxDecoration(
                                  color: const Color(0xff4698be),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Colors.black),
                                ),
                                child: const Icon(
                                  FontAwesomeIcons.arrowRight,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
