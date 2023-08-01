import 'package:flutter/material.dart';

class EnviarNotificacionScreen extends StatefulWidget {
  @override
  _EnviarNotificacionScreenState createState() => _EnviarNotificacionScreenState();
}

class _EnviarNotificacionScreenState extends State<EnviarNotificacionScreen> {
  final TextEditingController _tokenController = TextEditingController();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _cuerpoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enviar Notificación'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _tokenController,
              decoration: InputDecoration(labelText: 'Token del destinatario'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título de la notificación'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: _cuerpoController,
              decoration: InputDecoration(labelText: 'Cuerpo de la notificación'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _enviarNotificacion,
              child: Text('Enviar Notificación'),
            ),
          ],
        ),
      ),
    );
  }

  void _enviarNotificacion() {
    String destinatarioToken = _tokenController.text.trim();
    String titulo = _tituloController.text.trim();
    String cuerpo = _cuerpoController.text.trim();

    if (destinatarioToken.isNotEmpty && titulo.isNotEmpty && cuerpo.isNotEmpty) {
      //enviarNotificacion(destinatarioToken, titulo, cuerpo);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Por favor, completa todos los campos.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
