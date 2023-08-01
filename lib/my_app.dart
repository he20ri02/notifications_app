import 'package:flutter/material.dart';
import 'package:notificaciones_app/screens/home.dart';
import 'package:notificaciones_app/screens/message_screen.dart';
import 'package:notificaciones_app/screens/principal_screen.dart';
import 'package:notificaciones_app/services/push_notification_service.dart';

//convertir a statefulwidget
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();

    PushNotificationService.messagesStream.listen((mensaje) {
      print('------------DESDE MYAPP mensaje: $mensaje');

      navigatorKey.currentState?.pushNamed('/mensaje', arguments: mensaje);

      final snackBar =
          SnackBar(content: Text('Esto es snackbar msj: $mensaje'));
      scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones push',
      initialRoute: '/principal',
      scaffoldMessengerKey: scaffoldKey,
      navigatorKey: navigatorKey,
      routes: {
        '/home': (_) => Home(),
        '/mensaje': (_) => MessageScreen(),
        '/principal':(_) => EnviarNotificacionScreen()
      },
    );
  }
}
