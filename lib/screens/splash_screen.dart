import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ondas_ad/components/constants.dart';
import 'package:ondas_ad/screens/initial_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const InitialScreen(),
          ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [myBlue, Colors.white],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                child: Image.asset(
                  'assets/images/logos.png',
                ),
              ),
            ],
          )),
    );
  }
}
