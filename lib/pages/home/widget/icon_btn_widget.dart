import 'package:flutter/material.dart';
import 'package:wallet_app/constants/styling_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback callback;
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: callback,
          style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              side: const BorderSide(
                color: Colors.transparent,
              ),
              padding: const EdgeInsets.all(16),
              elevation: 5,
              backgroundColor: Colors.white,
              shadowColor: Colors.grey.withOpacity(0.2)),
          child: Icon(icon, color: primaryColor),
        ),
        const SizedBox(height: 5),
        Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
