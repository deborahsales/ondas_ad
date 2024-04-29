import 'package:flutter/material.dart';
import 'package:ondas_ad/screens/student_screen.dart';
import 'package:ondas_ad/screens/teacher_screen.dart';

import '../components/constants.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(myMargem),
            child: Text(
              'Quem está acessando?',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.height * 0.03),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: EdgeInsets.all(myMargem),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const StudentScreen()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.02),
                          child: Image.asset(
                            'assets/images/estudante.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Estudante',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Padding(
                      padding: EdgeInsets.all(myMargem),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TeacherScreen()));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.02),
                          child: Image.asset(
                            'assets/images/educador.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Educador',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.height * 0.02),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }
}
