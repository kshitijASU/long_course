import 'package:flutter/material.dart';

import 'package:long_course_project/constants/routes.dart';
import 'package:long_course_project/services/auth_exceptions.dart';
import 'package:long_course_project/services/auth_service.dart';
import 'package:long_course_project/utils/show_error_dialog.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: Column(
          children: [
            TextField(
              controller: _email,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration:
                  const InputDecoration(hintText: 'Enter your email here'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration:
                  const InputDecoration(hintText: 'Enter your password here'),
            ),
            TextButton(
                onPressed: () async {
                  try {
                    final email = _email.text;
                    final password = _password.text;
                    await AuthService.firebase().logIn(
                      email: email,
                      password: password,
                    );
                    final user = AuthService.firebase().currentUser;
                    if (user?.isEmailVerified ?? false) {
                      if (!mounted) return;
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        notesRoute,
                        (route) => false,
                      );
                    } else {
                      if (!mounted) return;
                      Navigator.of(context).pushNamed(
                        verifyEmailRoute,
                      );
                    }
                  } on UserNotFoundAuthException {
                    await showErrorDialog(context, 'User not Found');
                  } on WrongPasswordAuthException {
                    await showErrorDialog(context, 'Wrong Password');
                  } on GenericAuthException {
                    await showErrorDialog(context, 'Authentication Error');
                  }
                },
                child: const Text('Login')),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(registerRoute, (route) => false);
                },
                child: const Text('I am a New User?'))
          ],
        ));
  }
}
