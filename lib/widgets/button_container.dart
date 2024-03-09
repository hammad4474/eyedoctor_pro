import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Button_container extends StatelessWidget {
  String text = "";
  void Function() onButtonPressed;

  Button_container({
    super.key,
    required this.text,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      shadowColor: Colors.black,
      child: Container(
        height: 140,
        width: 140,
        decoration: BoxDecoration(
          color: Color(0xffc1e7f6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              text,
              style: GoogleFonts.nunitoSans(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 60),
              child: Container(
                  height: 32,
                  width: 60,
                  decoration: BoxDecoration(
                      color: Color(0xff4497be),
                      borderRadius: BorderRadius.circular(50)),
                  //alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(
                      FontAwesomeIcons.longArrowAltRight,
                    ),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: onButtonPressed,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
