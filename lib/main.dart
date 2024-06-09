import 'package:firebase_auth/firebase_auth.dart';
import 'package:resq_connect/model/auth/auth_checker.dart';
import 'package:resq_connect/model/auth/services/auth_service.dart';

import 'package:resq_connect/firebase_options.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'view/landingpage/landingpage.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 // await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(393, 852),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'SIH App',
              theme: ThemeData.dark().copyWith(
                  primaryColor: const Color(0xFF744EBA),
                  scaffoldBackgroundColor: const Color(0xFF1A1A1A)),
              // home: const LandingPage(),
              // home: StreamBuilder(
              //   builder: (context, snapshot) {
              //     if (snapshot.hasData) {
              //       return const BottomNavBarOrg();
              //     } else {
              //       return const LoginOrg();
              //     }
              //   },
              //   stream: FirebaseAuth.instance.authStateChanges(),
              // )
              home: const AuthChecker());
        });
  }
}
