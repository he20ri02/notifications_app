import 'package:flutter/material.dart';
import 'package:notificaciones_app/my_app.dart';

import 'services/push_notification_service.dart';

void main() async {
  //los plugins usan widgets - crear unos widgets
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initApp();

  runApp(const MyApp());
}
