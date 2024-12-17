import 'package:eyedoctor_pro/auth/forgot_password.dart';
import 'package:eyedoctor_pro/auth/signup_screen.dart';
import 'package:eyedoctor_pro/screens/home_page.dart';
import 'package:eyedoctor_pro/widgets/custome_textField.dart';
import 'package:eyedoctor_pro/widgets/text_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _isloading = false;
  bool isPasswordVisible = false;
  @override
  void loginUser() async {
    setState(() {
      _isloading = true;
    });

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailControler.text.trim(),
        password: passwordControler.text.trim(),
      );

      // Clear text fields after successful login
      emailControler.clear();
      passwordControler.clear();

      // Navigate to the home screen after login
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
        case "user-not-found":
          errorMessage = "No user found for that email.";
          break;
        case "wrong-password":
          errorMessage = "Wrong password provided.";
          break;
        default:
          errorMessage = e.message ?? "An unknown error occurred.";
          break;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  bool _isPasswordVisible1 = true;

  _toggleVisibility() {
    setState(() {
      _isPasswordVisible1 = !_isPasswordVisible1;
    });
  }

  @override
  void dispose() {
    emailControler.dispose();
    passwordControler.dispose();
    if (mounted) {
      super.dispose();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf7fd),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 100.0),
            decoration: const BoxDecoration(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset('assets/images/eye.png')),
                    SizedBox(
                      height: 10,
                    ),
                    TextView(
                      text: "Login to your Account",
                      fontfamily: 'Pacifico',
                      fontSize: 28,
                      textColor: Colors.black,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      controller: emailControler,
                      isEmail: true,
                      keyboardType: TextInputType.text,
                      isobscureText: false,
                      obscurechracter: "*",
                      hintText: "Email Address",
                      suffixIcon: const SizedBox.shrink(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      controller: passwordControler,
                      keyboardType: TextInputType.text,
                      isobscureText: _isPasswordVisible1,
                      obscurechracter: "*",
                      hintText: "Password",
                      isSuffixShow: true,
                      click: _toggleVisibility,
                      suffixIcon: _isPasswordVisible1
                          ? const Icon(CupertinoIcons.eye_slash)
                          : const Icon(CupertinoIcons.eye),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPasswordView()),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 180),
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 11),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          loginUser();
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
                                color: Colors.black,
                                strokeWidth: 1.0,
                              ),
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Dont have an account ?',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Get.to(() => SignupScreen(),
                                  transition: Transition.fade);
                            },
                            child: Text(
                              'SignUp!',
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
      ),
    );
  }
}
