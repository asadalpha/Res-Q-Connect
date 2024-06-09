import 'package:resq_connect/view/auth_screens/publicSide/signup_page_public.dart';
import 'package:resq_connect/model/auth/services/auth_service.dart';
import 'package:resq_connect/view/userflow/public_side/bottomNav/bottom_nav_bar_public.dart';

import 'package:resq_connect/view/widgets/customtextfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPagePublic extends StatefulWidget {
  const LoginPagePublic({super.key});

  @override
  State<LoginPagePublic> createState() => _LoginPagePublicState();
}

class _LoginPagePublicState extends State<LoginPagePublic> {
  //final TextEditingController empIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isSendingReq = false;
  bool hideText = true;
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
          builder: (context) => const BottomNavBarPublic(),
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
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          // Container(
          //   height: 200,
          //   width: 200,
          //   decoration: const BoxDecoration(
          //       image: DecorationImage(
          //           image: AssetImage("assets/images/loginart.png"))),
          // ),
          const Padding(
            padding: EdgeInsets.only(top: 40.0, bottom: 20),
            child: Text(
              "Log In",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          CustomTextField(
            maxLines: 1,
            controller: emailController,
            text1: "Email",
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormField(
            obscureText: hideText,
            cursorWidth: 2,
            cursorColor: Colors.white,
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
                            color: Colors.white,
                            size: 25.sp,
                          )
                        : Icon(
                            Icons.visibility_outlined,
                            color: Colors.white,
                            size: 25.sp,
                          )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: "Password"),
            maxLines: 1,
          ),
          const Spacer(),
          isSendingReq
              ? const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: () {
                        signIn();
                      },
                      child: const Text(
                        "Continue",
                        style: TextStyle(
                            color: Colors.white,
                            // fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("New To ResQ?"),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignUpPublic()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ]),
      )),
    );
  }
}
