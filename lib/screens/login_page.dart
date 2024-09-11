import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mentor_academy_task/helpers/sanck_bar.dart';
import 'package:mentor_academy_task/widgets/Button.dart';
import 'package:mentor_academy_task/screens/home_screen.dart';
import 'package:mentor_academy_task/screens/signup_page.dart';
import 'package:mentor_academy_task/widgets/text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  static String id = 'LoginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;
  String? password;
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                  "Welcome Back",
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
                          "Sign in",
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
                          padding: const EdgeInsets.all(6.0),
                          child: CustomButton(
                            text: 'Sign In',
                            ontap: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  isLoading = true;
                                  setState(() {});
                                  await login_User(context);
                                  print("signed in succfully");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                  );
                                } on FirebaseAuthException catch (ex) {
                                  if (ex.code == 'user-not-found') {
                                    showSnackbar(context,
                                        'No user found for that email.');
                                  } else if (ex.code == 'wrong-password') {
                                    showSnackbar(context,
                                        'Wrong password provided for that user.');
                                  }
                                } catch (e) {
                                  print(e);
                                  showSnackbar(context, "there was an error");
                                }
                                isLoading = false;
                                setState(() {});
                              }
                            },
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "don't have an account?",
                            style: TextStyle(color: Colors.black),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()),
                            ),
                            child: Text("   sign up",
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 0, 164, 239))),
                          )
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> login_User(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
