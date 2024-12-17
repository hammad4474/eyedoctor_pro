import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eyedoctor_pro/auth/login_screen.dart';
import 'package:eyedoctor_pro/screens/home_page.dart';
import 'package:eyedoctor_pro/widgets/custome_textField.dart';
import 'package:eyedoctor_pro/widgets/text_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final confirmpasswordControler = TextEditingController();
  final phoneNoController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool _isloading = false;

  void signUpUser(String name, String email, String password) async {
    setState(() {
      _isloading = true;
    });

    try {
      if (password != confirmpasswordControler.text.trim()) {
        Fluttertoast.showToast(
          msg: "Passwords do not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
        );
        setState(() {
          _isloading = false;
        });
        return;
      }

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
        'email': email,
      });

      Fluttertoast.showToast(
        msg: "Signup successful!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.7),
        textColor: Colors.white,
      );

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isloading = false;
      });

      String errorMessage;
      switch (e.code) {
        case "weak-password":
          errorMessage = "The password provided is too weak.";
          break;
        case "email-already-in-use":
          errorMessage = "The account already exists for that email.";
          break;
        default:
          errorMessage = e.message ?? "An unknown error occurred.";
          break;
      }

      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
    } catch (e) {
      setState(() {
        _isloading = false;
      });

      Fluttertoast.showToast(
        msg: "An error occurred. Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
      );
    }
  }

  bool _isPasswordVisible1 = true;
  bool _isPasswordVisible2 = true;

  _toggleVisibility() {
    setState(() {
      _isPasswordVisible1 = !_isPasswordVisible1;
    });
  }

  _toggleVisibility2() {
    setState(() {
      _isPasswordVisible2 = !_isPasswordVisible2;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControler.dispose();
    passwordControler.dispose();
    nameController.dispose();
    confirmpasswordControler.dispose();
    phoneNoController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe2f3fc),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/eye.png')),
                  const TextView(
                    text: "Create your Account",
                    fontfamily: 'Pacifico',
                    fontSize: 28,
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    isobscureText: false,
                    obscurechracter: "*",
                    hintText: "your name",
                    suffixIcon: const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: emailControler,
                    keyboardType: TextInputType.text,
                    isobscureText: false,
                    isEmail: true,
                    obscurechracter: "*",
                    hintText: "name@email.com",
                    isSuffixShow: true,
                    suffixIcon: const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: phoneNoController,
                    keyboardType: TextInputType.number,
                    isobscureText: false,
                    obscurechracter: "*",
                    hintText: "phone no",
                    isSuffixShow: true,
                    isPhoneNumber: true,
                    suffixIcon: const SizedBox.shrink(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    controller: passwordControler,
                    keyboardType: TextInputType.text,
                    isobscureText: _isPasswordVisible1,
                    click: _toggleVisibility,
                    obscurechracter: "*",
                    hintText: "Create a Password",
                    isSuffixShow: true,
                    suffixIcon: _isPasswordVisible1
                        ? const Icon(CupertinoIcons.eye_slash)
                        : const Icon(CupertinoIcons.eye),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextField(
                    controller: confirmpasswordControler,
                    password: passwordControler.text,
                    keyboardType: TextInputType.text,
                    click: _toggleVisibility2,
                    isConfirmPassword: true,
                    isobscureText: _isPasswordVisible2,
                    obscurechracter: "*",
                    hintText: "Confirm Password",
                    isSuffixShow: true,
                    suffixIcon: _isPasswordVisible2
                        ? const Icon(CupertinoIcons.eye_slash)
                        : const Icon(CupertinoIcons.eye),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        signUpUser(
                            nameController.text.trim(),
                            emailControler.text.trim(),
                            passwordControler.text.trim());
                      } else {
                        print("please fill");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fixedSize: const Size(300, 50),
                      backgroundColor: Color(0xff4497be),
                      shadowColor: Colors.transparent,
                    ),
                    child: _isloading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2.0,
                            ),
                          )
                        : const Text(
                            "Confirm",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ?',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(() => LoginScreen(),
                                transition: Transition.fade);
                          },
                          child: Text(
                            'LogIn!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
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
