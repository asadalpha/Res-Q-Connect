import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import '../auth_screens/publicSide/login_page_public.dart';
import '../auth_screens/orgSide/login_page_org.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20.0),
          child: Column(children: [
            Lottie.asset('assets/globe.json', height: 300),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPageOrg()));
              },
              child: const MyContainer(
                text: "Continue as Admin",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 80.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPagePublic()));
                },
                child: const MyContainer(
                  text: "Continue as User",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  final String text;
  const MyContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF744EBA),
        border: Border.all(
          color: const Color.fromARGB(255, 116, 78, 186),
        ),
        borderRadius: BorderRadius.circular(8), //#23169D
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20.sp,
              fontWeight: FontWeight.w200,
            )),
      ),
    );
  }
}


// LoginPageOrg
// loginPageOrg