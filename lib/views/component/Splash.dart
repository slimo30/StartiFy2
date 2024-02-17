import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:startify/globale.dart';
import 'package:startify/views/screen/Login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatescreen();
  }

  _navigatescreen() async {
    await Future.delayed(Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blanc,
      body: Center(
        child: Container(
          child: Image(
            image: AssetImage(
              'assets/images/logo.png',
            ),
          ),
        ),
      )
          .animate()
          .fade(duration: 500.ms)
          .scale(delay: 500.ms)
          .fade(delay: 500.ms),
    );
  }
}
