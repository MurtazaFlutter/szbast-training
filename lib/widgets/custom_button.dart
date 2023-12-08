import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const CustomButton({
    super.key,
    this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff6342E8),
            borderRadius: BorderRadius.circular(30)),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.lato(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
