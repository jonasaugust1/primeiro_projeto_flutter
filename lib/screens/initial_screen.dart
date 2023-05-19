import 'package:flutter/material.dart';
import 'package:primeiro_projeto/components/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        title: const Text('Tarefas'),
        backgroundColor: Colors.blue,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(milliseconds: 800),
        child: ListView(
          children: const [
            Task(
                'Aprender Flutter para desenvolver aplicativo da Ztaurus',
                'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                3),
            Task(
                'Aprender Italiano',
                'https://png.pngtree.com/background/20210716/original/pngtree-italia-wavy-flag-background-picture-image_1332172.jpg',
                2),
            Task(
                'Aprender Python',
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/800px-Python-logo-notext.svg.png',
                3),
            Task(
                'Aprender Mandarim',
                'https://img.freepik.com/fotos-gratis/bandeira-da-china_1401-89.jpg?w=740&t=st=1684451101~exp=1684451701~hmac=653d500feee754cedb930886cfd1f8224343db00a968038c7b338b7606905fb5',
                5),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          opacity = !opacity;
        });
      },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
