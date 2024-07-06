import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Avaliação Final',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: const Color.fromARGB(255, 247, 247, 248),
              child: ClipOval(
                child: Image.asset(
                  'images/ifpi.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Avaliação Final da Disciplina de Programação de Dispositivos Móveis II',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Crie uma interface de aplicativo Flutter utilizando o Scaffold e mais quatro tipos diferentes de widgets (como Text, Image, Icon, Container, etc.). Além disso, implemente um widget Stateful ou Stateless que ofereça funcionalidade interativa',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Critérios de Avaliação:Uso adequado do Scaffold para estruturar o aplicativo.Inclusão de quatro widgets diferentes além do Scaffold.Implementação correta de um widget Stateful ou Stateless com funcionalidade interativa.- Organização e clareza do código.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
