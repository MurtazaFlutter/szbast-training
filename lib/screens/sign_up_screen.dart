import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geeta/controllers/loading_controller.dart';
import 'package:geeta/screens/home_screen.dart';
import 'package:geeta/service/auth_helper.dart';
import 'package:geeta/widgets/custom_button.dart';
import 'package:geeta/widgets/custom_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final loading = Provider.of<LoadingController>(context, listen: false);

    late final TextEditingController username = TextEditingController();
    late final TextEditingController password = TextEditingController();
    late final TextEditingController email = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/dress.png',
                        height: 250,
                      )),
                ),
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    color: const Color(0xff6342E8).withOpacity(0.8),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff6342E8),
                        Color(0xff7F77FE),
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  top: 60,
                  left: 30,
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 150,
                  left: 30,
                  child: Text(
                    "Let's started with Geeta.",
                    style: GoogleFonts.lato(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 30,
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "Log in",
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ])),
                ),
                Positioned(
                  top: 280,
                  left: 30,
                  child: Text(
                    "REGISTER",
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Your Name",
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  const CustomField(
                    hintText: 'Your Full Name',
                    prefixIcon: Icons.person,
                  ),
                  const Gap(20),
                  Text(
                    "Email address",
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  const CustomField(
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email,
                  ),
                  const Gap(10),
                  Text(
                    "Password",
                    style: GoogleFonts.lato(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Gap(10),
                  const CustomField(
                    hintText: 'Enter your Password',
                    prefixIcon: Icons.lock,
                  ),
                  const Gap(30),
                  CustomButton(
                    text: "REGISTER",
                    onTap: () {
                      AuthHelper().signUp(
                          email.text, password.text, username.text, context);
                      email.clear();
                      username.clear();
                      password.clear();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                  ),
                  const Gap(20),
                  const Center(
                      child: Text(
                          "By joining I agree to recieve emails from Geeta"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
