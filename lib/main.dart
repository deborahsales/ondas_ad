import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ondas_ad/components/constants.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import 'package:ondas_ad/screens/tittle_screen.dart';

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
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    myMargem = screenHeight * 0.013;
    myMargem2 = screenHeight * 0.005;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ondas do Aula Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: myPurple),
        useMaterial3: true,
      ),
      home: const TittleScreen(),
    );
  }
}
