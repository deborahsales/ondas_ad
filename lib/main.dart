import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ondas_ad/data/ondas_dao.dart';
import 'package:ondas_ad/screens/initial_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // OndasDao().insertDataFromCSV();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ondas do Aula Digital',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const InitialScreen(),
    );
  }
}

