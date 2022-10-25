import 'package:flutter/material.dart';
import 'package:long_course_project/constants/routes.dart';
import 'package:long_course_project/services/auth_service.dart';

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(
        children: [
          const Text(
              "We've sent you an email verification. Please open it in order to verify your account."),
          const Text('Did not recieve the verification email?'),
          TextButton(
              onPressed: () async {
                await AuthService.firebase().sendEmailVerification();
                if (!mounted) {
                  return;
                }
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text('Send Again')),
          TextButton(
            child: const Text('Restart'),
            onPressed: () async {
              await AuthService.firebase().logout();
              if (!mounted) return;
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(registerRoute, (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
