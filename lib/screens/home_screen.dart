import 'package:charles_ejikeme/auth/services/google_sign_in.dart';
import 'package:charles_ejikeme/auth/sign_in/google_sign_in_page.dart';
import 'package:charles_ejikeme/data/porfolio_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CvList extends StatelessWidget {
  const CvList({super.key});

  void logOut(BuildContext context) {
    AuthService().signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const SignIn(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            // Add the icon widget
            icon: const Icon(Icons.logout),
            onPressed: () {
              logOut(context);
            },
          ),
        ],
        title: Text(
          'My Portfolio',
          style: GoogleFonts.patuaOne(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        backgroundColor: Colors.grey[200], // Set your desired app bar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.builder(
          itemCount: cvModels.length,
          itemBuilder: (context, index) {
            final cvModel = cvModels[index];

            return Card(
              color: Colors.grey[200],
              margin: const EdgeInsets.only(bottom: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 6,
              clipBehavior: Clip.antiAlias,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundColor: Colors
                              .grey[800], // Customize avatar background color
                          child: Text(
                            (index + 1).toString(),
                            style: GoogleFonts.patuaOne(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cvModel.title,
                              style: GoogleFonts.patuaOne(
                                fontWeight: FontWeight.bold,
                                fontSize: 20, // Increase the title font size
                                color:
                                    Colors.black, // Set your desired text color
                              ),
                            ),
                            const SizedBox(height: 12), // Increase the space
                            Text(
                              cvModel.subtitle,
                              style: GoogleFonts.patuaOne(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          cvModel.trailing,
                          style: GoogleFonts.patuaOne(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
