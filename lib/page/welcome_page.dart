import 'package:flutter/material.dart';
import 'package:todoapp/Widget/welcomepage_footer.dart';
import 'package:todoapp/Widget/welcomepage_form.dart';
import 'package:todoapp/Widget/welcomepage_header.dart';

const Color kAccentColor = Color(0xFFFE7C64);
const Color kBackgroundColor = Color(0xFF19283D);
const Color kTextColorPrimary = Color(0xFFECEFF1);
const Color kTextColorSecondary = Color(0xFFB0BEC5);
const Color kButtonColorPrimary = Color(0xFFECEFF1);
const Color kButtonTextColorPrimary = Color(0xFF455A64);
const Color kIconColor = Color(0xFF455A64);

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: SignInForm(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
