import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

const _horizontalPadding = 24.0;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            _LoginIcon(),
            SizedBox(height: 120),
            _GoogleSignInButton(),


          ],
        ),
      ),
    );

  }
}

class _LoginIcon extends StatelessWidget {
  const _LoginIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(text: const TextSpan(text: "Hello ofc", style: TextStyle(color: Colors.black)),  );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(Buttons.Google, text: "Sign up with Google", onPressed: (){});
  }
}


