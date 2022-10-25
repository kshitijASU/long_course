import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:long_course_project/constants/routes.dart';
import 'package:long_course_project/services/auth_exceptions.dart';
import 'package:long_course_project/services/auth_service.dart';
import 'package:long_course_project/utils/show_error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
      appBar: AppBar(title: const Text('Register')),
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
                final email = _email.text;
                final password = _password.text;
                try {
                  await AuthService.firebase().createUser(
                    email: email,
                    password: password,
                  );
                  await AuthService.firebase().sendEmailVerification();
                  if (!mounted) return;
                  Navigator.of(context).pushNamed(verifyEmailRoute);
                } on WeakPasswordAuthException catch (_) {
                  await showErrorDialog(
                    context,
                    'Weak Password',
                  );
                } on InvalidEmailAuthException catch (_) {
                  await showErrorDialog(
                    context,
                    'Invalid Email',
                  );
                } on GenericAuthException {
                  await showErrorDialog(context, 'Failed To Register');
                }
              },
              child: const Text('Register')),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(loginRoute, (route) => false);
              },
              child: const Text('Already an Existing User? Login.')),
        ],
      ),
    );
  }
}
