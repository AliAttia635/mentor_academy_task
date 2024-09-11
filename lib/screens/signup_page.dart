import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_academy_task/helpers/sanck_bar.dart';
import 'package:mentor_academy_task/widgets/Button.dart';
import 'package:mentor_academy_task/screens/home_screen.dart';
import 'package:mentor_academy_task/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String id = 'signupPage';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;
  String? password;
  String? confirmPassword;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                "assets/images/lock.jpg",
                height: 175,
              ),
              const Center(
                child: Text(
                  "Create an Account",
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontFamily: 'Pacifico'),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 6),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CustomFormTextField(
                        hint: "Email",
                        onChange: (data) {
                          email = data;
                        },
                        isPassword: false,
                        prefixIcon: Icon(
                          Icons.email,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CustomFormTextField(
                        hint: "Password",
                        onChange: (data) {
                          password = data;
                        },
                        isPassword: true,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CustomFormTextField(
                        hint: "Confirm Password",
                        onChange: (data) {
                          confirmPassword = data;
                        },
                        isPassword: true,
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: CustomButton(
                        text: "Sign Up",
                        ontap: () async {
                          if (formKey.currentState!.validate()) {
                            if (password != confirmPassword) {
                              showSnackbar(
                                context,
                                "Both passwords are not the same.",
                              );
                              return;
                            }

                            try {
                              isLoading = true;
                              setState(() {});
                              await register_user(context);
                              print("User signed up successfully");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackbar(context,
                                    'The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                showSnackbar(context,
                                    'The account already exists for that email.');
                              } else if (e.code ==
                                  "The email address is badly formatted") {
                                showSnackbar(context,
                                    'The email address is badly formatted.');
                              }
                            } catch (e) {
                              showSnackbar(context, "There was an error");
                              log(e.toString());
                            }
                            isLoading = false;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            "   Log in",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 0, 164, 239)),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> register_user(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
