import 'package:eyedoctor_pro/widgets/custome_textField.dart';
import 'package:eyedoctor_pro/widgets/evaluated_button.dart';
import 'package:eyedoctor_pro/widgets/text_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ForgotPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf7fd),
      appBar: AppBar(
        backgroundColor: Color(0xffebf7fd),
        elevation: 1,
        toolbarHeight: 80,
        title: const Text(
          "Forgot Password",
          style: TextStyle(letterSpacing: -1),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const TextView(
                    text: "Enter an Email to reset Password",
                    fontSize: 16,
                    fontfamily: 'RedHatTextBold',
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    isEmail: true,
                    isobscureText: false,
                    obscurechracter: "*",
                    hintText: "Email Address",
                    suffixIcon: const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  EvaluatedButton(
                    text: "Submit",
                    onPress: () async {
                      if (formkey.currentState!.validate()) {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: _emailController.text.trim());
                        Fluttertoast.showToast(
                            msg: "Reset link sent to email!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: (Colors.red).withOpacity(0.7),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please enter all the fields",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: (Colors.red).withOpacity(0.7),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    isLoading: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
