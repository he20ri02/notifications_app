import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments ?? 'No msj';

    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
      ),
      body: Center(
        child: Text(
          'Mensaje: $args',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}
