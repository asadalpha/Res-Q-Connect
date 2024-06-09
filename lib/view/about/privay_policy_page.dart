import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy for ResQ Connect',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Effective Date: [Insert Date]',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Introduction',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Welcome to ResQ Connect! We are committed to protecting your privacy and ensuring that your personal information is handled in a safe and responsible manner. This Privacy Policy explains how we collect, use, and share information when you use our mobile application, ResQ Connect.',
            ),
            SizedBox(height: 16),
            Text(
              '2. Information We Collect',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'a. Personal Information\nWhen you use ResQ Connect, we may collect personal information that you voluntarily provide to us. This includes:\n- Name\n- Email address\n- Phone number\n- Organization details (for agencies and NGOs)\n- Location data (only if you grant permission)',
            ),
            SizedBox(height: 8),
            Text(
              'b. Non-Personal Information\nWe may also collect non-personal information about your usage of the app, including:\n- Device type and model\n- Operating system and version\n- App usage data\n- IP address',
            ),
            SizedBox(height: 16),
            Text(
              '3. How We Use Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We use the information we collect for the following purposes:\n- To connect agencies and NGOs effectively\n- To provide and improve our services\n- To communicate with you regarding your use of the app\n- To send you updates, promotional materials, and other information that may be of interest\n- To analyze usage and trends to improve user experience\n- To ensure the safety and security of our users',
            ),
            SizedBox(height: 16),
            Text(
              '4. Sharing Your Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may share your information in the following situations:\n- With other users: When you participate in the platform, certain information may be shared with other users (e.g., your name and organization details).\n- With service providers: We may share information with third-party service providers who assist us in operating our app and providing services.\n- Legal requirements: We may disclose your information if required by law or in response to a legal process.',
            ),
            SizedBox(height: 16),
            Text(
              '5. Data Security',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We take reasonable measures to protect your information from unauthorized access, alteration, disclosure, or destruction. This includes implementing industry-standard security measures and regularly reviewing our data practices.',
            ),
            SizedBox(height: 16),
            Text(
              '6. Your Choices',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'You have the following choices regarding your information:\n- Access and update: You can access and update your personal information through the app’s settings.\n- Opt-out: You can opt-out of receiving promotional communications by following the instructions in those communications.\n- Delete: You can request the deletion of your account and personal information by contacting us at [Insert Contact Email].',
            ),
            SizedBox(height: 16),
            Text(
              '7. Children\'s Privacy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'ResQ Connect is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware that we have inadvertently received personal information from a user under the age of 13, we will delete such information from our records.',
            ),
            SizedBox(height: 16),
            Text(
              '8. Changes to This Privacy Policy',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We may update this Privacy Policy from time to time. If we make significant changes, we will notify you through the app or by other means. Your continued use of the app after such changes constitutes your acceptance of the updated Privacy Policy.',
            ),
            SizedBox(height: 16),
            Text(
              '9. Contact Us',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at:\n- Email: [Insert Contact Email]\n- Address: [Insert Physical Address, if applicable]',
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

