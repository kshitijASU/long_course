import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:long_course_project/constants/routes.dart';
import 'package:long_course_project/services/auth_service.dart';
import 'package:long_course_project/views/notes_view.dart';
// import 'dart:developer';

import 'views/login.dart';
import 'views/register.dart';
import 'views/verify_email.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
      verifyEmailRoute: (context) => const VerifyEmailView(),
    },
  ));
}

// HOME PAGE IS LIKE OUR ROUTING PAGE, WHERE WE PERFORM
// CENTRAL BASED AUTHENTICATION.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: AuthService.firebase().initialize(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              final user = AuthService.firebase().currentUser;
              log(user.toString());
              if (user != null) {
                if (user.isEmailVerified) {
                  return const NotesView();
                } else {
                  return const VerifyEmailView();
                }
              } else {
                return const LoginView();
              }
            default:
              return const CircularProgressIndicator();
          }
        });
  }
}
