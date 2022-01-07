import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_02_mobile/provider/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Home();
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('algo deu errado'),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.blue,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton.icon(
                      icon: const FaIcon(
                        FontAwesomeIcons.google,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        final provider = Provider.of<GoogleSignSignOutProvider>(
                            context,
                            listen: false);
                        provider.googleLogin();
                      },
                      label: const Text(
                        'Entrar com Google',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.black,
                          minimumSize: const Size(double.infinity, 50)),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }
}
