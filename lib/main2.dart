import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ShoppingListApp());
}


class ShoppingListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primaryColor: Color(0xff0073e6),
        textTheme: TextTheme(bodyText1: TextStyle(color: Color(0xff333333))),
        scaffoldBackgroundColor: Color(0xfff5f5f5),
      ),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => LandingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/passwordRetrieve': (context) => PasswordRetrieve(),
      },
    );
  }
}
