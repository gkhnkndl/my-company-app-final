import 'package:flutter/material.dart';
import 'package:vize/screens/loading.dart';
import 'screens/companyChat.dart';
import 'screens/helpScreen.dart';
import 'screens/homeScreen.dart';
import 'screens/loginScreen.dart';
import 'screens/myCompany.dart';
import 'screens/personelScreen.dart';
import 'screens/profileScreen.dart';
import 'screens/registerScreen.dart';
import 'screens/settingsScreen.dart';
import 'screens/welcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => HomeScreen(),
        '/newlogin': (context) => LoginScreenNew(),
        '/register': (context) => registerScreen(),
        '/profile': (context) => ProfileScreen(),
        '/welcome': (context) => WelcomeScreen(),
        '/settings': (context) => SettingsScreen(),
        '/company': (context) => MyCompanyScreen(),
        '/help': (context) => HelpScreen(),
        '/personnels': (context) => personelScreen(),
        '/chat': (context) => CompanyChat(),
        '/loading': (context) => LoadingScreen(),
      },
      title: 'MyCompanyApp',
      //başlangıç ekranı
      initialRoute: '/welcome',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
