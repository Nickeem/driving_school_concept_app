import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:app/layout/image_placeholder.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

const _horizontalPadding = 24.0;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          restorationId: 'login_list_view',
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: _horizontalPadding,
          ),
          children: const [
            SizedBox(height: 80),
            _SchoolTitle(),
            SizedBox(height: 120),
            _SmallLogo(),
            SizedBox(height: 90),
            _GoogleSignInButton(),
          ],
        ),
      ),
    );

  }
}
class _SmallLogo extends StatelessWidget {
  const _SmallLogo();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 64),
      child: SizedBox(
        height: 160,
        child: ExcludeSemantics(
          child: FadeInImagePlaceholder(
            image: AssetImage('icons/logo.png'),
            placeholder: SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
class _SchoolTitle extends StatelessWidget {
  const _SchoolTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Example Driving School',style: GoogleFonts.montserrat(fontSize: 24),textAlign: TextAlign.center,);
    // RichText(text: const TextSpan(text: "Placeholder Driving School", style: TextStyle(color: Colors.black)), textAlign: TextAlign.center, );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(Buttons.Google, text: "Sign up with Google",
        onPressed: () async {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

          // Obtain the auth details from the request
          final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          return await FirebaseAuth.instance.signInWithCredential(credential);
        });
  }
}

/*
Sign out:
  _googleSignIn.signOut();
  FirebaseAuth.instance.ignOut();
 */
