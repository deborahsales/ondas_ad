import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ondas_ad/components/constants.dart';
import 'package:ondas_ad/screens/splash_screen.dart';

class TittleScreen extends StatefulWidget {
  const TittleScreen({super.key});

  @override
  State<TittleScreen> createState() => _TittleScreenState();
}

class _TittleScreenState extends State<TittleScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(milliseconds: 3000), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const SplashScreen(),
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
        decoration: const BoxDecoration(
          color: myBlue,
        ),
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(myMargem * 2),
          child: Image.asset(
              'assets/images/titulo.png'
          ),
        ),
        ),
      ),
    );
  }
}
