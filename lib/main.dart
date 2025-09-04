import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soil_health_monitoring_app/Provider/auth_provider.dart';
import 'package:soil_health_monitoring_app/Provider/reading_provider.dart';
import 'package:soil_health_monitoring_app/Screens/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => AuthProvider()),
    ChangeNotifierProvider(create: (context)=>ReadingProvider())],
    child: MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
