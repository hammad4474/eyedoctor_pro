import 'package:eyedoctor_pro/screens/gallery_test.dart';
import 'package:eyedoctor_pro/screens/home_page.dart';
import 'package:eyedoctor_pro/screens/image_test_result.dart';
import 'package:eyedoctor_pro/screens/medicines_info.dart';
import 'package:flutter/material.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key});

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: 60,
        width: 390,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Image.asset('assets/images/home.png')),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GalleryTest()));
                },
                child: Image.asset('assets/images/gallery.png')),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ImageScreen()));
                },
                child: Image.asset('assets/images/imgtst.png')),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MedicineScreen()));
                  },
                  child: Image.asset('assets/images/dawai.png')),
            ),
          ],
        ),
      ),
    );
  }
}
