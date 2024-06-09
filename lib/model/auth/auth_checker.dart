import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resq_connect/view/landingpage/landingpage.dart';
import 'package:resq_connect/view/userflow/orgside/orgs/homepageorg.dart';
import 'package:resq_connect/view/userflow/orgside/orgs/navpageorg.dart';
import 'package:resq_connect/view/userflow/public_side/bottomNav/bottom_nav_bar_public.dart';
import 'package:resq_connect/view/userflow/public_side/home/homepage.dart';

class AuthChecker extends StatelessWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection('admins')
                .doc(snapshot.data!.uid)
                .get(),
            builder: (context, adminSnapshot) {
              if (adminSnapshot.connectionState == ConnectionState.waiting) {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              } else if (adminSnapshot.hasData && adminSnapshot.data!.exists) {
                final adminData =
                    adminSnapshot.data!.data() as Map<String, dynamic>;
                if (adminData['isAdmin'] == true) {
                  return const BottomNavBarOrg();
                } else {
                  return const LandingPage();
                }
              } else {
                return const BottomNavBarPublic(); 
              }
            },
          );
        } else {
          return const LandingPage();
        }
      },
    );
  }
}
