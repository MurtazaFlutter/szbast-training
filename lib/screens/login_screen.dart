import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geeta/screens/sign_up_screen.dart';
import 'package:geeta/service/auth_helper.dart';
import 'package:geeta/widgets/custom_button.dart';
import 'package:geeta/widgets/custom_field.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final TextEditingController email = TextEditingController();
    late final TextEditingController password = TextEditingController();
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
                      child: Image.asset('assets/images/dress.png')),
                ),
                Container(
                  height: 450,
                  color: const Color(0xffA573FF).withOpacity(0.8),
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
                    "Welcome Back!",
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 30,
                  child: Text(
                    "Yay! You're back! Thanks for shopping with us. \nWe have excited deals and promotions going \non, grab your pick now! ",
                    style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 380,
                  left: 30,
                  child: Text(
                    "LOG IN",
                    style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(30),
                  const Text("Email address"),
                  const Gap(10),
                  const CustomField(
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const Gap(30),
                  const Text("Password"),
                  const Gap(10),
                  const CustomField(
                    hintText: 'Enter your Password',
                    prefixIcon: Icons.lock_outlined,
                  ),
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: true,
                            onChanged: (value) {},
                          ),
                          const Text("Remember me"),
                        ],
                      ),
                      const Text("Forgot Password?")
                    ],
                  ),
                  const Gap(10),
                  CustomButton(
                    text: 'LOGIN',
                    onTap: () {
                      AuthHelper().login(email.text, password.text, context);
                    },
                  ),
                  const Gap(10),
                  Center(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()));
                        },
                        child: const Text(
                            "Not registered yet? Create an Account ")),
                  ),
                  const Gap(50)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
