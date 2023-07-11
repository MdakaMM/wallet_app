import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(height: 30),
        Text(
          title,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(width: 50),
        Text(
          description,
          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
