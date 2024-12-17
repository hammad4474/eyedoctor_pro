import 'package:flutter/material.dart';

class EvaluatedButton extends StatelessWidget {
  final VoidCallback onPress;
  final bool isLoading;
  final String text;
  final double radius;
  final Color color;
  const EvaluatedButton({
    Key? key,
    required this.onPress,
    required this.isLoading,
    this.radius = 10,
    this.color = Colors.black,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 45,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff4497be),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
          shadowColor: Colors.blue,
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
