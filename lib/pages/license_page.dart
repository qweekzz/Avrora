import 'package:flutter/material.dart';

class License extends StatelessWidget {
  const License({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Я о приложении',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Это второе мое мобильное приложение напиисанное на flutter, если считать To Do лист скопированный с ютуб уроков. \n\nНачал я его делать весной 2022 на производственной практике, где мне дали ТЗ и пропросили сделать первые 3 страницы с аунтификацией по СМС в firebase. Это задание я сделал за 2 недели и у меня появилась проблема, которую я пробывал решать',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: ' очень долго.',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ' За это время я только понял, что проблема не в версиях зависемостей и вообще не в коде (т.к приложение заработоло на другом компьюторе). После этого я забыл про flutter до начала осени. \n\nВ начле учебного года я решил продолжить обучение и начал с переустановки ОС, и да, это решило проблему. Я продолжил изучать, разбираться в различных виджетах, в dart и в firebase. В итоге получилось это приложение.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
