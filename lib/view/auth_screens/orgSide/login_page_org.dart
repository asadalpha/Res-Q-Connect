// ignore_for_file: use_build_context_synchronously

import 'package:resq_connect/model/auth/services/auth_service.dart';

import 'package:resq_connect/view/widgets/customtextfield.dart';
import 'package:resq_connect/view/auth_screens/orgSide/signup_page_org.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../userflow/orgside/orgs/navpageorg.dart';

class LoginPageOrg extends StatefulWidget {
  const LoginPageOrg({super.key});

  @override
  State<LoginPageOrg> createState() => _LoginPageOrgState();
}

class _LoginPageOrgState extends State<LoginPageOrg> {
  bool hideText = true;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isSendingReq = false;
  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      setState(() {
        isSendingReq = true;
      });
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomNavBarOrg(),
        ),
      );
    } catch (e) {
      setState(() {
        isSendingReq = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  void dispose() {
    super.dispose();
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
                "Log In",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
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
                  obscureText: hideText,
                  cursorColor: const Color.fromARGB(31, 78, 77, 77),
                  controller: passwordController,
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
                      hintText: "Password"),
                  maxLines: 1,
                ),
              ),
            ),
          )
          // CustomTextField(
          //   maxLines: 1,
          //   controller: passwordController,
          //   text1: "Password",
          // ),
          ,
          SizedBox(
            height: 100.h,
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: isSendingReq
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  )
                : SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF4727A)),
                        onPressed: () {
                          signIn();
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
              const Text("New To ResQ?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpOrg()));
                  },
                  child: const Text(
                    "Sign Up",
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
