import 'package:charles_ejikeme/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  final String? title;
  final String imagePath;
  final Function() press;

  const RoundButton({
    Key? key,
    this.title = "Submit",
    required this.press,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 13.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: CustomColors.textColor,
          backgroundColor: Colors.grey[800],
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(12), // Customize the borderRadius here
          ),
        ),
        onPressed: press,
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
            const SizedBox(
              width: 50,
            ),
            Center(
              child: Text(
                title.toString(),
                style: GoogleFonts.patuaOne(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.textColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
