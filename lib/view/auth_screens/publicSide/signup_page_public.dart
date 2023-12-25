import 'package:resq_connect/model/auth/services/auth_service.dart';
import 'package:resq_connect/view/userflow/public_side/bottomNav/bottom_nav_bar_public.dart';
import 'package:resq_connect/view/widgets/customtextfield.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'login_page_public.dart';

class SignUpPublic extends StatefulWidget {
  const SignUpPublic({super.key});

  @override
  State<SignUpPublic> createState() => _SignUpPublicState();
}

class _SignUpPublicState extends State<SignUpPublic> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfmpassController = TextEditingController();
  bool isSendingReq = false;
  bool hideText = true;
  void signUp() async {
    if (passwordController.text != cnfmpassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not Match! ")));
      return;
    }
    if (userNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not Match! ")));
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      setState(() {
        isSendingReq = true;
      });
      await authService.signUpWithEmailPassword(emailController.text,
          passwordController.text, userNameController.text);
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavBarPublic(),
        ),
      );
      //print("sign up success");
    } catch (e) {
      setState(() {
        isSendingReq = false;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/loginart.png"))),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Sign Up",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CustomTextField(
            maxLines: 1,
            controller: userNameController,
            text1: "Username",
          ),
          CustomTextField(
            maxLines: 1,
            controller: emailController,
            text1: "Email",
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextFormField(
                  obscureText: true,
                  cursorColor: const Color.fromARGB(31, 78, 77, 77),
                  controller: passwordController,
                  decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Password"),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: TextFormField(
                  obscureText: hideText,
                  cursorColor: const Color.fromARGB(31, 78, 77, 77),
                  controller: cnfmpassController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hideText = !hideText;
                            });
                          },
                          icon: hideText
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: Colors.black,
                                  size: 25.sp,
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black,
                                  size: 25.sp,
                                )),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Confirm Password"),
                  maxLines: 1,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 70.h,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: SizedBox(
                height: 50,
                width: double.infinity,
                child: isSendingReq
                    ? const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF4727A)),
                        onPressed: () {
                          signUp();
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const LoginPagePublic()));
                  },
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        color: Color(
                          0xFFF4727A,
                        ),
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ]),
      )),
    );
  }
}
