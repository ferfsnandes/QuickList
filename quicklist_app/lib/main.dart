import 'package:flutter/material.dart';
import 'landing_page.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'home_page.dart';

//void main() async {
//WidgetsFlutterBinding.ensureInitialized();
//await Firebase.initializeApp();
//runApp(ShoppingListApp());
//}
void main() => runApp(const ShoppingListApp());

class ShoppingListApp extends StatelessWidget {
  const ShoppingListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primaryColor: const Color(0xff0073e6),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Color(0xff333333))),
        scaffoldBackgroundColor: const Color(0xfff5f5f5),
      ),
      initialRoute: '/landing',
      routes: {
        '/landing': (context) => const LandingPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        //'/passwordRetrieve': (context) => PasswordRetrieve(),
      },
    );
  }
}
