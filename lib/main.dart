import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ondas_ad/components/constants.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import 'package:ondas_ad/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  OndasDao().insertDataFromCSV();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    myMargem = MediaQuery.of(context).size.height * 0.013;
    myMargem2 = MediaQuery.of(context).size.height * 0.005;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ondas do Aula Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

