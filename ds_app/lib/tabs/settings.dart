import 'package:flutter/material.dart';
import 'package:app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

List<String> getSettingsTitles(BuildContext context) {
return <String>[
  'Sign out',
];
}

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Container(
        padding: const EdgeInsets.only(top: 0),
        child: ListView(
          restorationId: 'settings_list_view',
          shrinkWrap: true,
          children: [
            for (String title
            in getSettingsTitles(context)) ...[
              _SettingsItem(title),
              const Divider(
                color: Color(0xAA282828),
                height: 1,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        onSurface: Colors.white,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        GoogleSignIn().disconnect();
        FirebaseAuth.instance.signOut();
      },
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 28),
        child: Text(title),
      ),
    );
  }
}