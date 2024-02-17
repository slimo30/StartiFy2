import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startify/globale.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Add a startup',
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.bleu,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset(
                'assets/images/done.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'request sent successfully',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: AppColor.blackgrey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
