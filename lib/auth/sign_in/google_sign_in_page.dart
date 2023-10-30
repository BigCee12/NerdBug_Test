import 'package:charles_ejikeme/auth/services/google_sign_in.dart';
import 'package:charles_ejikeme/components/custom_button.dart';
import 'package:charles_ejikeme/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';



class SignIn extends StatefulWidget {
  const SignIn({super.key, });

  @override
  SignInState createState() => SignInState();
  
}

class SignInState extends State<SignIn> {

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: SizedBox(
        height: 100,
        width: 300,
        child: Center(
          child: Lottie.asset(
            'assets/lottie_files/charles_ejikeme.json',
            height: 100,
            width: 300,
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/my_cert.jpg',
              height: 320,
              width: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              // Center the content in the middle of the screen
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hi, my name is',
                      style: GoogleFonts.patuaOne(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'E J I K E M E   C H A R L E S ',
                      style: GoogleFonts.patuaOne(
                        color: Colors.grey[800],
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "I make M A G I C with F L U T T E R.",
                      style: GoogleFonts.patuaOne(
                        color: Colors.grey[800],
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "I'm a dedicated Flutter developer who crafts captivating and responsive mobile applications. With a passion for innovation and a commitment to detail. ",
                      style: GoogleFonts.patuaOne(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      "Would you like to see some of my works?",
                      style: GoogleFonts.patuaOne(
                        color: Colors.grey[800],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RoundButton(
                      imagePath: "assets/images/google_icon.png",
                      press: () async {
                        showLoaderDialog(context);

                        try {
                          final userCredential =
                              await AuthService().signInWithGoogle(context);

                          if (userCredential != null) {
                            // Navigate to CvList if sign-in is successful
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const CvList(),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text('Google sign-in failed',
                                    style: GoogleFonts.patuaOne(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            );
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('An error occurred: $e',
                                  style: GoogleFonts.patuaOne(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          );
                        } finally {
                          Navigator.of(context)
                              .pop(); // Dismiss the loader dialog
                        }
                      },
                      title: 'SIGN WITH GOOGLE',
                    ),
                    const SizedBox(height: 40.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
