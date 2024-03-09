import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatCard extends StatelessWidget {
  final Color color1;
  final bool fromSender;
  const ChatCard({super.key, required this.color1, required this.fromSender});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: fromSender
            ? BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20))
            : BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20)),
      ),
      child: Container(
        height: 54,
        // width: 260,
        decoration: BoxDecoration(
          color: color1,
          borderRadius: fromSender
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topRight: Radius.circular(20))
              : BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20)),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Hey! am chat bot",
            style: GoogleFonts.nunitoSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
    );
  }
}
