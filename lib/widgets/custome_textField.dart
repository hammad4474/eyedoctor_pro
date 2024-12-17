// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isobscureText;
  final String obscurechracter;
  final String hintText;
  final bool isSuffixShow;
  final bool isEmail;
  final bool isPhoneNumber;
  final String password;
  final VoidCallback? click;
  final bool isConfirmPassword;

  final Widget? suffixIcon;

  CustomTextField({
    Key? key,
    required this.controller,
    required this.keyboardType,
    required this.isobscureText,
    required this.obscurechracter,
    required this.hintText,
    this.isSuffixShow = false,
    this.password = '',
    this.isConfirmPassword = false,
    this.isEmail = false,
    this.click,
    this.suffixIcon,
    this.isPhoneNumber = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isobscureText,
      style: const TextStyle(),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return "";
        }
        if (isEmail) {
          if (!EmailValidator.validate(val)) {
            return "";
          }
        } else if (isConfirmPassword) {
          if (val != password) {
            return "";
          }
        } else if (isPhoneNumber) {
          if (!RegExp(r'^\d{11}$').hasMatch(val)) {
            return "";
          }
        } else if (isobscureText && val.length < 6) {
          return "";
        }
        return null;
      },
      obscuringCharacter: obscurechracter,
      decoration: fieldDecoration(height, width, isSuffixShow),
    );
  }

  InputDecoration fieldDecoration(
      double height, double width, bool isSuffixShoww) {
    return isSuffixShoww
        ? InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              maxHeight: height * 0.060,
              minHeight: height * 0.060,
              maxWidth: width * 0.84,
            ),
            filled: true,
            fillColor: Colors.white,
            errorStyle: TextStyle(height: 0),
            hintStyle: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
            hintText: hintText,
            suffixIcon: GestureDetector(
                onTap: () {
                  click != null ? click!() : null;
                },
                child: suffixIcon),
            border: textFieldBorder(
              Colors.black,
            ),
            enabledBorder: textFieldBorder(
              Colors.black,
            ),
          )
        : InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: BoxConstraints(
              maxHeight: height * 0.060,
              minHeight: height * 0.060,
              maxWidth: width * 0.84,
            ),
            filled: true,
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xFF8F9098),
            ),
            hintText: hintText,
            errorStyle: TextStyle(height: 0),
            border: textFieldBorder(
              Colors.black,
            ),
            enabledBorder: textFieldBorder(
              Colors.black,
            ),
          );
  }

  OutlineInputBorder textFieldBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: borderColor,
        width: 1.0,
      ),
    );
  }
}
