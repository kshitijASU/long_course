import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
  ));
}

// HOME PAGE IS LIKE OUR ROUTING PAGE, WHERE WE PERFORM
// CENTRAL BASED AUTHENTICATION.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                final FirebaseAuth auth = FirebaseAuth.instance;
                final user = auth.currentUser;
                if (user?.emailVerified ?? false) {
                  print('You are a verified user');
                } else {
                  print('You need to verify your email first.');
                }
                return const Text('Done');
              default:
                return const Text('Loading');
            }
          }),
    );
  }
}
